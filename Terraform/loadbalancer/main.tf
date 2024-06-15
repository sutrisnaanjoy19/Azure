terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

resource "cloudflare_record" "azure" {
  zone_id = var.zone_id
  name    = "azure"
  value   = "4.156.109.32"
  type    = "A"
  proxied = false
}
