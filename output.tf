output "Selected-VPC"{
    value = var.VPC_ID
}

output "Selected-Subnets"{
    value = var.Subnet_ID
}

output "Selected-SecurityGroup"{
    value = var.Security_Group_Names
}

output "Selected-AMI"{
    value = var.ami_id
}

output "Selected-IAM-EC2"{
    value = var.IAM_Role
}

output "Selected-Instance-Type"{
    value = var.instance_type
}
output "Selected-Instance-Name"{
    value = var.name
}