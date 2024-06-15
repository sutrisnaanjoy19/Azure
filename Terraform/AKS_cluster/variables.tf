variable "appId" {
  description = "Azure Kubernetes Service Cluster service account"
}
variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}
variable "location" {
  default = "East US"
}
variable "resource_group_name" {
  default = "Azure-test-eastus"
}

variable "kubernetes_version" {
  default = "1.28.9"
}
variable "suffix" {
  default = "EastUS"
}
variable "environment" {
  default = "staging"
}
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}
variable "subnet_address_prefix" {
  type    = list(string)
  default = ["10.0.0.0/24"]

}
