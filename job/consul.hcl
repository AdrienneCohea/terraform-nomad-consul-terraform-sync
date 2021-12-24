consul {
  address = "${address}"
  tls {
    enabled = true
    ca_cert = "/local/ca.pem"
  }
  token = "${token}"
}
