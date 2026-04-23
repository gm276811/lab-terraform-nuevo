provider "aws" {
  region = "us-east-1"
}

# 1. Definir el Security Group
resource "aws_security_group" "test-terraform-sg" {
  name        = "test-terraform-sg"
  description = "Permitir SSH entrante y todo el trafico saliente"

  # Ingress: Regla de entrada para SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress: Regla de salida (permitir todo)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-terraform-sg"
  }
}

# 2. Instancia de EC2 asociada al Security Group
resource "aws_instance" "test-terraform-ec2" {
  ami                    = "ami-0ea87431b78a82070"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  
  # Aquí conectamos ambos recursos usando el ID generado automáticamente
  vpc_security_group_ids = [aws_security_group.test-terraform-sg.id]

  tags = {
    Name = "test-terraform-ec2"
  }
}
