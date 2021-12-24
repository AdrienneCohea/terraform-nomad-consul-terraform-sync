{{ with secret "gcp/roleset/consul-terraform-sync/token" }}
terraform_provider "google" {
  project      = "${project}"
  zone         = "${zone}"
  access_token = "{{ .Data.token }}"
}
{{ end }}
