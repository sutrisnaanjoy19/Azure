# Cloudflare
variable "zone_id" {
  description = "<YOUR_ZONE_ID>"
}

variable "account_id" {
  description = "<YOUR_ACCOUNT_ID>"
}

variable "domain" {
  description = "<DOMAIN>"
  default     = "lordvader.me"
}

variable "api_token" {
  description = "<API_TOKEN>"
}
