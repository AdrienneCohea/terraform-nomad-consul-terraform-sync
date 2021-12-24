terraform_provider "google" {
  project      = "${project}"
  zone         = "${zone}"
  credentials  = "/local/credentials"
}
