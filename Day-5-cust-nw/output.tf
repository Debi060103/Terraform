output "public_ip" {
  value = aws_instance.name.public_ip
}

output "private_ip" {
  value = aws_instance.name.private_ip
}

output "vpc_id" {
  value = aws_vpc.dev.id
}