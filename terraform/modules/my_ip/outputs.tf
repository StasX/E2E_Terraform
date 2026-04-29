output "ip" {
  description = "My IP address"
  value       = "${chomp(data.http.my_ip.response_body)}"
}