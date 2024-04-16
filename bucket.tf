provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

resource "aws_s3_bucket" "habi_bucket" {
  bucket = "habi-bucket-1" # Replace with a unique bucket name of your choice

  tags = {
    Name = "My First Terraform Bucket"
  }
}

# Output the S3 bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.habi_bucket.arn # This will output the bucket arn
}
