  output "alb-dns-name" {
    value = aws_lb.application-lb
}
  output "vpc-id" {
    value = aws_vpc.vpc1.id
}

output "alb-sg-id" {
    value = aws_security_group.lb.id
}
output "ec2-sg-id" {
    value = aws_security_group.ec2.id
}
output "ec2-one-instance-id" {
    value = aws_instance.ec2-one.id
}
output "ec2-two-instance-id" {
    value = aws_instance.ec2-two.id
}
output "public-subnet1-id" {
    value = aws_subnet.public_subnet1.id
}
output "public-subnet2-id" {
    value = aws_subnet.public_subnet2.id
}
output "private-subnet1-id" {
    value = aws_subnet.private_subnet1.id
}
output "private-subnet2-id" {
    value = aws_subnet.private_subnet2.id
}
 