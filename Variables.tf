variable "tag" {
  default = "Terraform-IaaC"
  description = "This value is coming from automated TF suit."
}

variable "name" {
  default = "AutoCreated-TF"
  description = "This value is coming from automated TF suit."
}

variable "instance_type" {
  default = "t2.micro"
  description = "This value is coming from automated TF suit."
}

variable "availability_zones" {
  default = "us-east-1a"
  description = "This value is coming from automated TF suit."
}

variable "key-name" {
  default = "AWS-Session"
}

variable "git-name" {
  default = "Put your git name"
}

variable "git-token" {
  default = "Put your token"
}