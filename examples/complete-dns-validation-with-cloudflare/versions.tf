terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.40"
    }
    # Terraform v1.0.0 only functional with cloudflare versions less than or equal to 3.33.0
    # https://github.com/cloudflare/terraform-provider-cloudflare/issues/2340
    # Cloudflare provider version 3.33.0 introduced a regression which produced errors when
    # passing credentials via environment variables
    # https://github.com/cloudflare/terraform-provider-cloudflare/issues/2184
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.4, <=3.32"
    }
  }
}
