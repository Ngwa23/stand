variable "ingress" {
    type = list(number)
    default = [80, 443]
}

variable "egress" {
    type = list(number)
    default = [0]
}

resource "aws_security_group" "web_traffic" {
    name = "Allow Web Traffic"
    # vpc_id = module.eip.aws_vpc.demo.id

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

        dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

# module "eip" {
#     source = "../eip"
#     instance_id = aws_vpc.demo.id
# }

output "sg_name" {
    value = aws_security_group.web_traffic.name
}
