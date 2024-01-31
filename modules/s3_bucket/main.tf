# S3 bucket resource definition
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  
}

# S3 bucket logging configuration
resource "aws_s3_bucket_logging" "example_logging" {
  bucket = var.bucket_name

  target_bucket = var.bucket_name
  target_prefix = "logs/"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"
}