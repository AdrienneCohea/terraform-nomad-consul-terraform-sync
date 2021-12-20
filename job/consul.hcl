consul {
  address = "https://service.consul.service:8501"
#  tls {
#    enabled = true
#    ca_cert = "/tmp/ca.pem"
#  }
  token = "${consul_token}"
}
