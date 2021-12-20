resource "nomad_job" "consul_terraform_sync" {
  jobspec = templatefile("${path.module}/job/consul-terraform-sync.hcl", {
    datacenter  = var.datacenter
    cts_version = var.cts_version
    ca_cert     = file(var.ca_cert)
    config      = file("${path.module}/job/config.hcl")
    consul = templatefile("${path.module}/job/consul.hcl", {
      consul_token = var.consul_token
    })
    tasks = templatefile("${path.module}/job/tasks.hcl", {
      name           = var.task_name
      description    = var.description
      provider       = var.module_provider
      service        = var.service
      source         = var.module_source
      version        = var.module_version
      variable_files = var.variable_files
    })
    dns_tfvars = templatefile("${path.module}/job/dns.tfvars", {
      managed_zone = var.managed_zone
    })
  })
}
