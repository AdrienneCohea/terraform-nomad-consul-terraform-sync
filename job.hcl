job "network-automation" {
  datacenters = ["${datacenter}"]

  group "consul-terraform-sync" {
    count = 1

    task "main" {
      driver = "docker"

      config {
        image = "hashicorp/consul-terraform-sync:${cts_version}"
        dns_servers = ["169.254.1.1"]
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

      template {
        data = <<EOH
{{ with secret "gcp/roleset/consul-terraform-sync/key" }}
{{ .Data.private_key_data | base64Decode }}
{{ end }}
        EOH
        destination = "local/credentials.json"
      }
    }
  }
}
