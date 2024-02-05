# TerraformProject

# Terraform / AWS Infrastructure Setup Deliverables:

Create a Terraform repository that creates the following resources in AWS:
**Auto Scaling Group:**
- Deploy an Auto Scaling Group using the standard AWS Linux AMI.
- Ensure the ASG scales based on CPU utilization (For example, scale-out when CPU >
70%, and scale-in when CPU < 30%).
- Ensure the security group created for this project is attached to the instances

**IAM Policy and Role Creation:**
- Create an IAM policy that grants read/write access to a specific S3 bucket.
- Attach this policy to an IAM role.
- Associate this IAM role with the EC2 instances in the ASG, allowing them to interact
with the S3 bucket you will create.

**S3 Bucket:**
- Create an S3 bucket with appropriate configuration (e.g., versioning, logging).
Security Group:
- Create a security group for the EC2 instances with rules to allow inbound and
outbound traffic on ports 80 & 443.

## Prerequisites:

* Terraform

# Other Parameters

* **aws_region:** The AWS region in which the resources will be created (e.g., "us-east-1").

* **ami_id**: The ID of the Amazon Machine Image (AMI) used to launch instances (e.g., "ami-0a3c3a20c09d6f377").

* **instance_type:** The type of EC2 instance to launch (e.g., "t3.micro").

* **asg_min_size:** The minimum number of instances in the Auto Scaling Group.

* **asg_max_size** The maximum number of instances in the Auto Scaling Group.

* **asg_desired_capacity:** The desired number of instances in the Auto Scaling Group.

* **vpc_subnet_ids:** The IDs of the subnets in which the instances will be launched.

* **s3_bucket_name:** The name of the S3 bucket to be created.

* **log_bucket_name:** The name of the S3 bucket for logs.

* **availability_zones:** The availability zones in which the instances will be launched.

* **vpc_zone_identifier:** The IDs of the VPC zones in which the instances will be launched.

(https://registry.terraform.io/providers/hashicorp/aws/latest)

## Deployment

Exporting credentials in the best practices **aws configure**

$ export access_key = "AKIAV25RB46XGKICKB5Z"

$ export secret_key = "TFU4NjraBZ8k4+H4aBlStvOZ9XwZAJcImbXPw4YL"

Terraform init

Terraform plan

Teffarom apply

When you consider having the first version of your infrastructure you can run the command `terraform init` and Terraform will create the initial plan to be applied when creating the infrastructure.

With the plan in place you know which resources are going to be created, after confirming everything looks like what you were expecting you can run `terraform apply`. This will create the actual infrastructure.

After having the infrastructure in place you will need to evolve it by adding new resources or updating any of the existing ones. After doing this, you can run `terraform refresh` and a new plan will be created. After validating the changes in the new plan you can run `terraform apply` again and the actual infrastructure will be updated.

In the end, if you no longer need the infrastructure you can run `terraform destroy` and the actual infrastructure will be terminated.




