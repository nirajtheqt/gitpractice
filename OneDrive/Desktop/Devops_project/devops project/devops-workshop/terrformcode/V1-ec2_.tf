provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  key_name = "dpp"
  security_groups = ["demo-Sg"]
  }
//terraform init ,terr validate , terraform plan , terraform apply
resource "aws_security_group" "demo-Sg" {
  name        = "ssh gorup"
  description = "Allow ssh trafficc"
  

  ingress {
    description      = "ssh from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_sshs"
  }
}