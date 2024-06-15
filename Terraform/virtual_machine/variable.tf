variable "resource_prefix" {
  type    = string
  default = "testing"
}
variable "resource_group_name" {
  type    = string
  default = "Azure-testing"
}
variable "location" {
  type    = string
  default = "EastUS"
}
variable "admin_user" {
  description = "username"
}

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
