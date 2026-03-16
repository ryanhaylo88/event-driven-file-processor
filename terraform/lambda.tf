resource "aws_lambda_function" "file_processor" {
  function_name = "event-file-processor"
  # Reference outputs.tf
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  handler = "handler.lambda_handler"
  runtime = "python3.11"
  role = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  # Self reference
  function_name = aws_lambda_function.file_processor.function_name
  principal = "s3.amazonaws.com"
  source_arn = aws_s3_bucket.uploads.arn
}

resource "aws_s3_bucket_notification" "upload_trigger" {
  # Refence s3.tf
  bucket = aws_s3_bucket.uploads.id

  lambda_function {
    # Self reference
    lambda_function_arn = aws_lambda_function.file_processor.arn
    events = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    # Self refrence
    aws_lambda_permission.allow_s3
  ]
}