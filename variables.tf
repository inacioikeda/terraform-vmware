variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_resource_pool" {}
variable "vsphere_network" {}
variable "adapter_type" {}
variable "vsphere_datacenter" {}
variable "template_image" {}
variable "guest_id" {}
//variable "host_name" {}
variable "dns_servers_list" {
    type = "list"
}
variable "vcpu" {}
variable "ram" {}
variable "disk_datastore" {}
variable "disk_size" {}
variable "domain" {}
variable "label" {}
//variable "vlan_id" {}
//variable "ipv4_address" {}
variable "prefix_length" {}
variable "gateway" {}
    

