variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "env" {
  description = "env variable"
  
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0a3c3a20c09d6f377"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "asg_min_size" {
  description = "Minimum size for Auto Scaling Group"
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum size for Auto Scaling Group"
  default     = 3
}

variable "asg_desired_capacity" {
  description = "Desired capacity for Auto Scaling Group"
  default     = 2
}

variable "vpc_subnet_ids" {
  description = "VPC subnet IDs for Auto Scaling Group"
  type        = list(string)
  default     = ["subnet-05a0a02e4e97026c5", "subnet-07c58f75816364ee0"]
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "example-bucket-nur2314"
  type = string
}

variable "log_bucket_name" {
  description = "Name of the log bucket"
  default     = "example-log-bucket2"
  type = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Add your desired availability zones
}

variable "vpc_zone_identifier" {
  default = ["subnet-12345678", "subnet-87654321"]

}
