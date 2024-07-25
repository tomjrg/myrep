resource "oci_load_balancer" "Load_Balancer" {
  compartment_id = var.compartment_ocid
  display_name   = "demo-lb"
  shape          = "100Mbps"
  subnet_ids     = [oci_core_subnet.subnet.id]
}

resource "oci_load_balancer_backend_set" web-servers-backend {
 health_checker {
  interval_ms = "10000"
  port = "80"
  protocol = "HTTP"
  response_body_regex = ""
  retries = "3"
  return_code = "200"
  timeout_in_millis = "3000"
  url_path = "/"
}
load_balancer_id = oci_load_balancer.Load_Balancer.id
name = "web-servers-backend"
policy = "ROUND_ROBIN"
}

resource "oci_load_balancer_backend" web-server-01 {
 backendset_name = oci_load_balancer_backend_set.web-servers-backend.name
 backup = "false"
 drain = "false"
 load_balancer_id = oci_load_balancer.Load_Balancer.id
 ip_address = oci_core_instance.web-01.private_ip
 offline = "false"
 port = "80"
 weight = "1"
}

resource "oci_load_balancer_backend" web-server-02 {
 backendset_name = oci_load_balancer_backend_set.web-servers-backend.name
 backup = "false"
 drain = "false"
 load_balancer_id = oci_load_balancer.Load_Balancer.id
 ip_address = oci_core_instance.web-02.private_ip
 offline = "false"
 port = "80"
 weight = "1"
}
