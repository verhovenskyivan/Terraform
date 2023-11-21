provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

# Define an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (adjust to your preferred AMI)
  instance_type = "t2.micro" # Change to your desired instance type

  tags = {
    Name = "example-instance"
  }
}

# Output the instance's public IP address
output "public_ip" {
  value = aws_instance.example.public_ip
}
