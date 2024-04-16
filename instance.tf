# Create an IAM instance profile
resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "your-instance-profile" 
  role = aws_iam_role.my_role.name
}

# Launch an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0a699202e5027c10d"         # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type
  key_name      = "keypair"  # Replace with your actual key pair name

  user_data = <<-EOF
  #!/bin/bash
  # Use this for your user data (script from top to bottom)
  # install httpd (Linux 2 version)
  sudo yum update -y
  sudo yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "terraform-instance" #Replace with your instance name 
  }
}


# Output the instance IP
output "instance_id" {
  value = aws_instance.example_instance.public_ip # This will output the instance ip
}