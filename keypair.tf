# Generates a secure private key 
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create a Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "week10-key"  
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save file
resource "local_file" "ssh_key" {
  filename = "keypair.pem"
  content  = tls_private_key.ec2_key.private_key_pem
}

#data for amazon linux

data "aws_ami" "amazon-2" {
    most_recent = true
  
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
    owners = ["amazon"]
  }
 

