provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "event-file-processor"
      Environment = "dev"
      Owner       = "ryan"
      ManagedBy   = "Terraform"
    }
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../lambda/handler.py"
  output_path = "../lambda/lambda.zip"
}

