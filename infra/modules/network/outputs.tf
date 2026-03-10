output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "alb_sg" {
  value = aws_security_group.alb.id
}

output "ecs_sg" {
  value = aws_security_group.ecs.id
}