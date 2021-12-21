consul {
  address = "https://consul.service.consul:8501"
  tls {
    enabled = true
    ca_cert = "/local/ca.pem"
  }
  token = "${consul_token}"
}
