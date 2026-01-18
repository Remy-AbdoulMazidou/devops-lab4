module "endpoint" {
  source = "./modules/test-endpoint"
  url    = "https://example.com"
}

output "status_code" {
  value = module.endpoint.status_code
}

output "response_body" {
  value = module.endpoint.response_body
}
