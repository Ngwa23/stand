/* this is the main module block created in the current and parent directory.  
From this module block, child blocks can be called in the main.tf module and should be 
referenced properly.
*/
//Terraform block
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # Optional but recommended in production
    }
  }
}

//Provider block
provider "aws" {
    region = "us-east-2"
    profile = "terence" 
}

module "db" {     //this is initializing the db module/directory
    source = "./db"
}

module "web" {       // eip and sg were ran as child modules inside this module
    source = "./web"
}

output "PrivateIP" {
    value = module.db.PrivateIP  // this specified in the db module/directory
}

output "PublicIP" {
    value = module.web.pub_ip //calling the web eip
}