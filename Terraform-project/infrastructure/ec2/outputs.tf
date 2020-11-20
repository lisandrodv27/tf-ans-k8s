output "ec2_public_ip" {
  value = aws_instance.project_vm.public_ip
} 