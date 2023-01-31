variable "instance_id" {
    type = string
}

resource "aws_eip" "web_ip" {
    instance = var.instance_id
    # depends_on = [
    #   aws_internet_gateway.demo
    # ]
}

# resource "aws_vpc" "demo" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#       Name = "myDemoVPC"
#   }
# }

# resource "aws_internet_gateway" "demo" {
#   vpc_id = aws_vpc.demo.id // the .id is attached because vpc is being called inside igw

#   tags = {
#     Name = "myDemoIGW"
#   }
# }

# resource "aws_subnet" "demo" {

#   availability_zone       = us-east-2a
#   cidr_block              = "10.0.0.0/24"
#   map_public_ip_on_launch = true
#   vpc_id                  = aws_vpc.demo.id

#   // depends_on = [aws_internet_gateway.gw]

#   tags = {
#       Name = "Public Subnet"
#   }
# }

output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}
