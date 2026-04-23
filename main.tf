provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test-terraform-ec2" {
  ami           = "ami-0ea87431b78a82070" 
  instance_type = "t2.micro"
  key_name      = "vockey"

  tags = {
    Name = "test-terraform-ec2"
  }
}
