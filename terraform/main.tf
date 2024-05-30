provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" { #name of resorce
  ami           = "ami-05fa00d4c63e32376" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}

#create EC2 instance on this scripts