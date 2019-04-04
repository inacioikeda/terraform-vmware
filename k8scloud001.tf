resource "vsphere_virtual_machine" "vm1" {
  name             = "k8scloud001"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 4096
  guest_id = "${var.guest_id}"
  wait_for_guest_net_timeout = 0
  
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
    adapter_type   = "${var.adapter_type}"
  }

  disk {
    size             = 30
    label            = "linux"
    eagerly_scrub    = false
    thin_provisioned = false
    unit_number      = 0
  }

  disk {
    size             = 20
    label            = "rancher"
    eagerly_scrub    = false
    thin_provisioned = false
    unit_number      = 1
  }

    disk {
    size             = 20
    label            = "docker"
    eagerly_scrub    = false
    thin_provisioned = false
    unit_number      = 2
  }

  clone {
    template_uuid       = "${var.template_image}"

    customize {
      linux_options {
        host_name       = "k8scloud001"
        domain          = "${var.domain}"
      }

      network_interface {
        ipv4_address    = "192.168.1.241"
        ipv4_netmask    = "${var.prefix_length}"
        dns_server_list = "${var.dns_servers_list}"
      }
      ipv4_gateway      = "${var.gateway}"
    }
  }
}
