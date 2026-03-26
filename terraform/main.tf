variable "ip" {
  default = ["10.0.0.1", "10.0.0.2", "10.0.0.3"] # imagine these coming from eg. aws_instance.web[*].access_ip_v4
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    instance_ips = var.ip  # or however you get the IP
  })
  filename = "${path.module}/../ansible/inventory.ini"
}
