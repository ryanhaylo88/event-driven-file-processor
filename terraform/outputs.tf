resource "aws_s3_bucket_notification" "upload_trigger" {
  # Reference s3.tf
  bucket = aws_s3_bucket.uploads.id

  lambda_function {
    # Reference lambda.tf
    lambda_function_arn = aws_lambda_function.file_processor.arn
    events = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    # Reference lambda.tf
    aws_lambda_permission.allow_s3
  ]
}