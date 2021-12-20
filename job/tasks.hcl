task {
  name           = "${name}"
  description    = "${description}"
  providers      = ["${provider}"]
  services       = ["${service}"]
  source         = "${source}"
  version        = "${version}"
  variable_files = ${variable_files}
}
