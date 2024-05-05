resource "aws_instance" "public-instance" {
  ami           = "ami-0f496107db66676ff"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet-1.id
  tags = {
    Name = "public-instance"
  }
} 