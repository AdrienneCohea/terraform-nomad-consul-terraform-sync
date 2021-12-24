resource "nomad_job" "consul_terraform_sync" {
  jobspec = templatefile("${path.module}/job.hcl", {
    datacenter  = var.datacenter
    cts_version = var.cts_version
    ca_cert     = file(var.ca_cert)
    config      = templatefile("${path.module}/job/config.hcl", {})
    provider = templatefile("${path.module}/job/provider.hcl", {
      project = var.project
      zone    = var.zone
    })
    consul = templatefile("${path.module}/job/consul.hcl", {
      address = var.consul.address
      token   = var.consul.token
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

  purge_on_destroy = true
}
