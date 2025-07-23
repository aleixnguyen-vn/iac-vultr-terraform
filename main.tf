terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.13.0"
    }
  }
}

provider "vultr" {
  api_key = var.vultr_api_key
}

resource "vultr_firewall_group" "fw" {
  description = "Demo firewall group"
}

resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = vultr_firewall_group.fw.id
  protocol           = "tcp"
  port               = "22"
  ip_type            = "v4"
  subnet             = "0.0.0.0"
  subnet_size        = 0
}

resource "vultr_firewall_rule" "http" {
  firewall_group_id = vultr_firewall_group.fw.id
  protocol           = "tcp"
  port               = "80"
  ip_type            = "v4"
  subnet             = "0.0.0.0"
  subnet_size        = 0
}

resource "vultr_instance" "vm" {
  region   = "ams"               # Ams region
  plan     = "vc2-1c-1gb"        # 1 CPU, 1GB RAM
  os_id    = 2284                 # Ubuntu 24.04
  label    = "terraform-demo"
  hostname = "terraform-demo"
  backups = "disabled"
  firewall_group_id = vultr_firewall_group.fw.id
}
