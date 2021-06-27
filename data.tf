# Getting VPC data from providers
data "aws_vpc" "VPC" {
    filter{
        name    = "vpc-id"
        values  = var.VPC_ID
    }
}

# Getting Subnet data from VPC, based on Subnet ID
data "aws_subnet" "Subnet" {
    vpc_id = data.aws_vpc.VPC.id
    filter{
        name = "subnet-id"
        values = var.Subnet_ID
    }
}

# IAM role for EC2 
data "aws_iam_role" "EC2iam" {
    name = var.IAM_Role
}
