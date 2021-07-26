##  ===================================
##  ===== PHOTON OS PACKER MODULE =====
##  ===================================

##  Created By  : Peter Keech
##  Email       : peter.a.keech@gmail.com
##  Version     : 1.0.0
##  Description : PhotonOS Packer Module
##  Requirements: Packer, vSphere Environment

##  ----------------------------
##  ----- DEFINE VARIABLES -----
##  ----------------------------


##  ----- VCSA VARIABLES -----

## VCSA SERVER
variable "vcenter_server" {
  description = "vCenter server to build the VM on"
}

## VCSA USERNAME
variable "vcenter_username" {
  description = "Username to authenticate to vCenter"
}

## VCSA PASSWORD
variable "vcenter_password" {
  description = "Password to authenticate to vCenter"
  default = ""
  sensitive = true
}

## VCSA CLUSTER
variable "vcenter_cluster" {}

## VCSA DATACENTER
variable "vcenter_datacenter" {}

## VCSA HOST
variable "vcenter_host" {}

## VCSA DATASTORE
variable "vcenter_datastore" {}

## VCSA FOLDER
variable "vcenter_folder" {
  description = "The vcenter folder to store the template"
}

##  ----- SSH VARIABLES -----

## SSH USERNAME
variable "connection_username" {
  description = "Virtual Machine SSH Username"
  default = "root"
}

## SSH PASSWORD
variable "connection_password" {
  description = "Virtual Machine SSH Password"
}

## SSH PRIVATE KEY
variable "ssh_private_key_file" {
    description = "SSH Private Key for VM"
}

##  ----- PHOTON OS VARIABLES -----

## URL FOR OS ISO INSTALL
variable "iso_url" {
  description = "The download url for the ISO"
  default = ""
}

## CHECKSUM FOR OS ISO
variable "iso_checksum" {
    description = "ISO Checksum"
}

## CHECKSUM TYPE FOR ISO
variable "iso_checksum_type" {
  description = "Checksum Type for OS ISO"
  default     = "sha256"
}

## PHOTON VERSION
variable "photon_version" {
  description = "PhotonOS Version"
}

## DEFINE VM GUEST OS
variable "guest_os_type" {
  description = "Guest Operating System Type"
}


##  ----- VIRTUAL MACHINE VARIABLES -----

## VIRTUAL MACHINE OS FAMILY SETTING
variable "os_family" {
  description = "OS Family builds the paths needed for packer"
  default = ""
}

## VIRTUAL MACHINE HARD DRIVE SIZE
variable "root_disk_size" {
  default = 35840
}

## VIRTUAL MACHINE HARDWARE VERSION
variable "vm_hardware_version" {
    default = "13"
}

## VIRTUAL MACHINE NETWORK CARD
variable "nic_type" {
  default = "vmxnet3"
}

## VIRTUAL MACHINE NETWORK
variable "vm_network" { }

## VIRTUAL MACHINE CPU
variable "num_cpu" {
  default = 2
}

## VIRTUAL MACHINE CORES
variable "num_cores" {
  default = 1
}

## VIRTUAL MACHINE MEMORY (RAM)
variable "vm_ram" {
  default = 1024
}

## VIRTUAL MACHINE BOOT COMMANDS
variable "boot_command" {
  description = "Commands to Run at VM Boot"
  default = [
    "<esc><wait>",
    "vmlinuz insecure_installation=1 initrd=initrd.img root=/dev/ram0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/photon.json photon.media=cdrom",
    "<enter>"
  ]
}