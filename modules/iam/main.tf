 resource "aws_iam_policy" "s3_policy"{

name        = "s3_policy" 
  description = "Policy for accessing specific S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Action    = ["s3:ListBucket", "s3:GetObject", "s3:PutObject"],
      Resource  = "arn:aws:s3:::${var.s3_bucket_name}/*"
    }]
  })
}

resource "aws_iam_role" "example" {
  name               = "example-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.example.name}"
}

resource "aws_iam_policy_attachment" "s3_policy_attachment" {
  name = "s3_policy_attachment"
  policy_arn = aws_iam_policy.s3_policy.arn
  roles      = [aws_iam_role.example.name]
}