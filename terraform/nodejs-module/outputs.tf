# Output the URL of the EC2 instance after the templates are applied
output "url" {
  value = "http://${aws_instance.nodejs_app.public_ip}:${var.port}"
}
