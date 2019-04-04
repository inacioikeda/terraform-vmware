# Vsphere Definitions
vsphere_server = "vcenter.xpto.com.br"
vsphere_user = "inacio.ikeda@xpto.com.br"
vsphere_password = "EstaNaoeaSenhaKKKKK"
vsphere_datacenter = "FabricaDS"
vsphere_datastore = "datastore_02"
vsphere_resource_pool = "DSSign-HML"
vsphere_network = "VM Network"
adapter_type = "vmxnet3"
# Image Definition
template_image = "42057636-2d17-8070-b5de-0209c7a34cfd"
guest_id = "rhel7_64Guest"
//host_name = "k8scloud003"
# Virtual Machine Specs
vcpu           = "2"
ram            = "8192"
disk_datastore = "datastore_02"
disk_size      = "30"
# Network Node Specs
label            = "VM Network"
//ipv4_address     = "192.168.1.243"
prefix_length    = "24"
gateway          = "192.168.1.99"
dns_servers_list = ["192.168.1.201", "8.8.8.8"]
domain           = "dssign.com.br"
