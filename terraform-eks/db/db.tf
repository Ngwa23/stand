resource "aws_instance" "db" {
    ami = "ami-03a0c45ebc70f98ea"
    instance_type = "t2.micro"
    # subnet_id = module.eip.aws_subnet.demo.id
    tags = {
        Name = "DB Server"
    }
}

# module "eip" {
#     source = "../eip" // child module is called becoz subnet_id is referencing it as module.eip
#     instance_id = aws_insatnce.db.id // declaring instance.id from the eip module
# }

# module "sg" {
#     source = "../sg"
# }

output "PrivateIP" {
    value = aws_instance.db.private_ip
}