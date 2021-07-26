##  ===================================
##  ===== PHOTON OS PACKER MODULE =====
##  ===================================

##  Created By  : Peter Keech
##  Email       : peter.a.keech@gmail.com
##  Version     : 1.0.0
##  Description : PhotonOS Packer Module
##  Requirements: Packer, vSphere Environment

## DEFINE PACKER REQUIREMENTS
packer {
  required_plugins {
    vsphere-iso = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/vsphere"
    }
  }
}

source "vsphere-iso" "photon" {

  ##  -------------------------------------
  ##  ----- STEP 1: DEFINE CONNECTION -----
  ##  -------------------------------------

  vcenter_server             = var.vcenter_server
  username                   = var.vcenter_username
  password                   = var.vcenter_password
  insecure_connection        = true 

  ## DEFINE VCSA SETTINGS
  cluster                    = var.vcenter_cluster
  datacenter                 = var.vcenter_datacenter
  host                       = var.vcenter_host
  datastore                  = var.vcenter_datastore
  folder                     = var.vcenter_folder

  ##  --------------------------------
  ##  ----- STEP 2: DEFINE IMAGE -----
  ##  --------------------------------

  ## GENERAL SETTINGS
  vm_name                     = format("PHOTONOS-V%s", var.photon_version)
  convert_to_template         = true
  notes                       = "This Template was Built with Love via Hashicorp Packer"
  shutdown_command            = "shutdown -h now"
  ip_wait_timeout             = "45m"

  ## VIRTUAL MACHINE HARDWARE
  vm_version                  = var.vm_hardware_version
  disk_controller_type        = ["pvscsi"]
  CPUs                        = var.num_cpu
  CPU_hot_plug                = true
  RAM                         = var.vm_ram
  RAM_hot_plug                = true
  RAM_reserve_all             = false
  guest_os_type               = var.guest_os_type

  ## OPERATING SYSTEM ISO
  iso_url                     = var.iso_url
  iso_checksum                = var.iso_checksum

  ## DEFINE VIRTUAL MACHINE NETWORKING
  network_adapters {
    network                   = var.vm_network
    network_card              = var.nic_type
  }

  ## DEFINE VIRTUAL MACHINE STORAGE
  storage {
    disk_size                 = var.root_disk_size
    disk_thin_provisioned     = true
  }

  ## DEFINE VIRTUAL MACHINE SSH SETTINGS
  ssh_username                = var.connection_username
  ssh_password                = var.connection_password
  ssh_private_key_file        = var.ssh_private_key_file
  ssh_timeout                 = "12h"
  ssh_port                    = "22"
  ssh_handshake_attempts      = "20"
  shutdown_timeout            = "15m"

  ## DEFINE VIRTUAL MACHINE BOOT SETTINGS
  boot_wait                   = "5s"
  http_directory              = "http"
  boot_command                = var.boot_command

  ## VMARE CONTENT LIBRARY SETTINGS
  content_library_destination = "Images"
  ovf                         = true
  description                 = format("PhotonOS v%s Template (%s)", var.photon_version, timestamp())
}


##  ------------------------------------------------------
##  ----- STEP 3: BUILD IMAGE + POST INSTALL SCRIPTS -----
##  ------------------------------------------------------

build {
  sources = ["source.vsphere-iso.photon"]

  ## BOOTSTRAP PHOTON OS
  provisioner "shell" {
    script = "ova/scripts/install.sh"
  }
}

