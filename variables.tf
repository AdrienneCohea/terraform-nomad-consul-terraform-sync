variable "datacenter" {
  type        = string
  default     = "dc1"
  description = "The Nomad datacenter in which to run Consul-Terraform-Sync"
}

variable "consul_token" {
  type        = string
  default     = "dc1"
  description = "The Consul ACL token to be used to sync"
}

variable "managed_zone" {
  type        = string
  description = "The DNS managed zone to create the A record in"
}

variable "task_name" {
  type        = string
  description = "Task name"
}

variable "description" {
  type        = string
  description = "Task description"
}

variable "module_provider" {
  type        = string
  description = "Task provider"
}


variable "service" {
  type        = string
  description = "Task service"
}

variable "module_source" {
  type        = string
  description = "Task service"
}

variable "module_version" {
  type        = string
  description = "Task service"
}

variable "variable_files" {
  type        = string
  description = "Variable files"
}


variable "ca_cert" {
  type        = string
  description = "Consul CA cert"
}

variable "cts_version" {
  type        = string
  description = "Consul-Terraform-Sync version to use (https://releases.hashicorp.com/consul-terraform-sync)"
}

variable "project" {
  type        = string
  description = "Google project for Terraform provider"
}

variable "zone" {
  type        = string
  description = "Google zone for Terraform provider"
}

variable "consul" {
  type = object({
    address = string
    token   = string
  })
}
