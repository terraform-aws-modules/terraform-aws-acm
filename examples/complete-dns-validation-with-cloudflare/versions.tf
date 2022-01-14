terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.53"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.4.0"
    }
  }
}
