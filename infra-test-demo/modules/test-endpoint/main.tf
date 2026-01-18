terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"
    }
  }
}

variable "url" {
  type = string
}

data "http" "this" {
  url = var.url
}

output "status_code" {
  value = data.http.this.status_code
}

output "response_body" {
  value = data.http.this.response_body
}
