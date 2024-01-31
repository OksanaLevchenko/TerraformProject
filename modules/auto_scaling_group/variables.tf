variable "ami_id" {
    # default = ami-0a3c3a20c09d6f377
}
variable "instance_type" {
    # default = t3.micro
}

variable "min_size" {
    default = 2
}
variable "max_size" {
    default = 4
}
variable "desired_capacity" {
    default = 2
}
variable "example_subnet" {
    # default = [aws_subnet.example1.id, aws_subnet.example2.id]

}

variable "instance_profile" {
  
}