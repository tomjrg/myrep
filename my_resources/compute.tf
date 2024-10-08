#Compute instances 1
resource "oci_core_instance" "web-01" {
   availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[var.AD -1]["name"]
   compartment_id = var.compartment_ocid
   display_name = "web-server-01"
   shape = var.instance_shape

create_vnic_details {
  subnet_id = oci_core_subnet.subnet.id
  display_name = "web-server-01"
}

source_details {
  source_type = "image"
  source_id = lookup(data.oci_core_images.compute_images.images[0], "id")
  boot_volume_size_in_gbs = "58"
}

metadata = {
  ssh_authorized_keys = chomp(file(var.ssh_public_key))
  user_data           = base64encode(var.user_data)
 }
}

#Compute instances 2
resource "oci_core_instance" "web-02" {
   availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[var.AD -1]["name"]
   compartment_id = var.compartment_ocid
   display_name = "web-server-02"
   shape = var.instance_shape
   
create_vnic_details {
  subnet_id = oci_core_subnet.subnet.id
  display_name = "web-server-02"
}

source_details {
  source_type = "image"
  source_id = lookup(data.oci_core_images.compute_images.images[0], "id")
  boot_volume_size_in_gbs = "58"
}

metadata = {
  ssh_authorized_keys = chomp(file(var.ssh_public_key))
  user_data           = base64encode(var.user_data)
 }
}
