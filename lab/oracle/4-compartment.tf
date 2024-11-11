# create a sub-compartment
resource "oci_identity_compartment" "i2lab" {
  description = "i2lab compartment"
  name        = var.env
}