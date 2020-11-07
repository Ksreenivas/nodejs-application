# Output EC2 instance URL from the nodejs_application module
output "prod_url" {
  value = module.nodejs_application.url
}
