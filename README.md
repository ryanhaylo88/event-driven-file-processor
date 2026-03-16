# Event-Driven File Processing Platform
This project demonstrates an **event-driven serverless architecture on AWS** using Terraform.  
When a file is uploaded to an S3 bucket, a Lambda function is automatically triggered to process the file.
The goal of this project is to showcase **Infrastructure as Code, AWS serverless services, and event-driven design**.
---
## Architecture
User uploads a file to S3 → S3 triggers Lambda → Lambda processes the event → logs results to CloudWatch.
---
## Technologies Used
- **Terraform** – Infrastructure as Code
- **AWS S3** – File storage and event trigger
- **AWS Lambda** – Serverless compute
- **IAM** – Secure permissions for Lambda
- **CloudWatch** – Logging and monitoring
- **Docker** - *Will be added in future for Lambda document processing testing*
- **AWS CLI** – Testing and file uploads
---
## Project Structure
---
## How It Works
1. A file is uploaded to the **S3 uploads bucket**
2. S3 emits an **ObjectCreated event**
3. The event triggers the **Lambda function**
4. Lambda reads event metadata and logs the uploaded file name
5. Logs appear in **CloudWatch**
Example log output:
---
## Deployment
### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/event-driven-file-processor.git
cd event-driven-file-processor
```
### 2. Deploy infrastructure with Terraform
```bash
cd terraform
terraform init
terraform apply
```
### 3. Test file with file upload to S3 bucket
```bash
./scripts/upload-test-file.sh test.txt
```
### 4. Verify CloudWatch Logs entries for event
AWS Console → Lambda → event-file-processor → Monitor → CloudWatch Logs  
Log management -> /aws/lambda/event-file-processor  
File uploaded to ryan-event-upload-bucket: test.txt