# Generates 2 secure private keys 
resource "tls_private_key" "ec2_key1" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "tls_private_key" "ec2_key2" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Keys Pair
resource "aws_key_pair" "ec2_key1" {
  key_name   = "privatekeypair1"  
  public_key = tls_private_key.ec2_key1.public_key_openssh
}
resource "aws_key_pair" "ec2_key2" {
  key_name   = "privatekeypair2"  
  public_key = tls_private_key.ec2_key2.public_key_openssh
}
# Save file
resource "local_file" "ssh_key1" {
  filename = "keypair.pem"
  content  = tls_private_key.ec2_key1.private_key_pem
}
resource "local_file" "ssh_key2" {
  filename = "keypair.pem"
  content  = tls_private_key.ec2_key2.private_key_pem
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
 

