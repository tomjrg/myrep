output "Load_balancer_Public_IP" {
  value = oci_load_balancer.Load_Balancer.ip_addresses
}
