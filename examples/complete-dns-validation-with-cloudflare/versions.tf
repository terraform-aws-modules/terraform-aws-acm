terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.4"
    }

    # Cloudflare has issues with tf 1.0 in < 3.33.1
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.33.1, < 4.0.0"
    }
  }
}
