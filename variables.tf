# All used variables are listed here

variable "VPC_ID"{
    type    = list(string)
    default = [""]
}

variable "Subnet_ID"{
    type    = list(string)
    default = [""]
}

variable "Security_Group_Names"{
    type    = list(string)
    default = [""]
}

variable "ami_id"{
    type    = string
    default = ""
}

variable "IAM_Role"{
    type    = string
    default = ""
}

variable "instance_type"{
    type    = string
    default = ""
}

variable "name"{
    type    = string
    default = ""
}

variable "user"{
    type    = string
    default = ""
}

variable "public_key" {
    default = ""
}

variable "private_key" {
    default = ""
}