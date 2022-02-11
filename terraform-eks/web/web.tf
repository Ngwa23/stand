resource "aws_instance" "web" {
    ami = "ami-03a0c45ebc70f98ea"
    instance_type = "t2.micro"
    # subnet_id = module.eip.aws_subnet.demo.id
    security_groups = [module.sg.sg_name] #reference using module/directory name and output block name
    user_data = file("./web/server-script.sh")
    tags = {
        Name = "Web Server"
    }
}

module "eip" {
    source = "../eip" //this is a child module represented by the ../
    instance_id = aws_instance.web.id //associating the instance to the eip
}

module "sg" {
    source = "../sg"
}

output "pub_ip" {
    value = module.eip.PublicIP
}