provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.disk_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 8196
  guest_id = "${var.guest_id}"
  wait_for_guest_net_timeout = 0
  
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
    adapter_type   = "${var.adapter_type}"
  }

  disk {
    size             = 40
    label            = "terraform-test"
    eagerly_scrub    = false
    thin_provisioned = false
    unit_number      = 0
  }

  clone {
    template_uuid       = "${var.template_image}"

    customize {
      linux_options {
        host_name       = "${var.host_name}"
        domain          = "${var.domain}"
      }

      network_interface {
        ipv4_address    = "${var.ipv4_address}"
        ipv4_netmask    = "${var.prefix_length}"
        dns_server_list = "${var.dns_servers_list}"
      }
      ipv4_gateway      = "${var.gateway}"
    }
  }
}
