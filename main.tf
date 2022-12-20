resource "aws_instance" "s1" {
  ami           = "ami-0283a57753b18025b"
  subnet_id   = aws_subnet.utk-subnet1.id
  instance_type = "t2.micro"

  tags = {
    Name = "Utkarsh-TF-Server-new2"
  }
}

resource "aws_vpc" "utk-vpc2" {
  depends_on = [ aws_instance.s1 ]
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

 tags = {
    Name = "utk-vpc2"
  }
}



resource "aws_vpc" "utk-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "utk.vpc"
  }
}

resource "aws_subnet" "utk-subnet1" {
  vpc_id     = aws_vpc.utk-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "utk-subnet1"
  }
}
resource "aws_subnet" "utk-subnet2" {
  vpc_id     = aws_vpc.utk-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "utk-subnet2"
  }
}

output "IP" {
value = aws_instance.s1.public_ip
}

/*
resource "aws_instance" "s2" {
  ami           = "ami-0ada6d94f396377f2"
  instance_type = "t2.micro"

  tags = {
    Name = "Utkarsh-TF-Server2"
  }
}
*/
