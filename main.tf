# Create Key
resource "aws_key_pair" "terraform_key" {
  key_name   = "mykeypair"
  public_key = "${file(var.public_key)}"
}

locals {
    vpc_id              = data.aws_vpc.VPC.id
    subnet_id           = data.aws_subnet.Subnet.id
    ssh_user            = var.user
    key_name            = aws_key_pair.terraform_key.key_name
    private_key_path    = "~/.ssh/mykeypair.pem"
}

# Create EC2 Image 
resource "aws_instance" "web" {
    ami                     = var.ami_id
    instance_type           = var.instance_type
    security_groups         = var.Security_Group_Names
    subnet_id               = data.aws_subnet.Subnet.id
    iam_instance_profile    = data.aws_iam_role.EC2iam.id
    associate_public_ip_address = "true"
    key_name                = aws_key_pair.terraform_key.key_name

    tags = {  
        Name            = var.name
    }
    
    provisioner "remote-exec" {
        inline          = ["sudo yum install python3 -y"]
       
        connection {
            type            = "ssh"
            host            = aws_instance.batchimage.public_ip
            user            = var.user
            private_key     = file(var.private_key)
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u ${var.user} -i ${aws_instance.batchimage.public_ip}, --private-key ${local.private_key_path} playbook.yml"
    }
}