job "network-automation" {
  datacenters = ["${datacenter}"]

  group "udp" {
    count = 1

    task "sync" {
      driver = "docker"

      config {
        image = "hashicorp/consul-terraform-sync:${cts_version}"
        args = [
          "-config-dir",
          "$${NOMAD_TASK_DIR}",
        ]
      }

      template {
        data = <<EOH
${config}
        EOH

        destination = "local/config.hcl"
      }

      template {
        data = <<EOH
${consul}
        EOH

        destination = "local/consul.hcl"
      }

      template {
        data = <<EOH
${tasks}
        EOH

        destination = "local/tasks.hcl"
      }

      template {
        data = <<EOH
${dns_tfvars}
        EOH

        destination = "local/dns.tfvars"
      }

      template {
        data = <<EOH
${ca_cert}
        EOH

        destination = "local/ca.pem"
      }
    }
  }
}
