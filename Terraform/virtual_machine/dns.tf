resource "cloudflare_record" "sre" {
  zone_id = var.zone_id
  name    = "sre"
  value   = azurerm_public_ip.testing.ip_address
  type    = "A"
  proxied = false
}

