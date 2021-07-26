<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/pkeech/Packer-PhotonOS">
    <img src="https://github.com/pkeech/Packer-PhotonOS/blob/main/docs/logo.png" alt="Logo" />
  </a>

  <p align="center">
    <a href="https://github.com/pkeech/Packer-PhotonOS/issues">Report Bug</a>
    ·
    <a href="https://github.com/pkeech/Packer-PhotonOS/issues">Request Feature</a>
  </p>
</p>

### About
The repo contains basic [HashiCorp Packer](https://www.packer.io/) scripts to generate a customized [PhotonOS OVA](https://vmware.github.io/photon/)

### Repository Structure
The directories contained within this repository are outlined in the table below with a brief description to their roles.

| Directory | Description |
| :---: | --- |
| `http` | Is the Packer HTTP boot directory |
| `ova` | Contains all the Packer files to generate the image |
| `ova/scripts` | Contains all the scripts utilized after the image has been created |

### Usage
*Placeholder*

``` bash
packer init ova
packer build --var-file=auto.pkrvars.hcl ova
```

### Version Updates
The table below briefly describes each update. For more information, view the releases page.

| Version | Description |
| :---: | --- | 
| 1.0.0 | Initial Release of PhotonOS Packer Scripts |

### Dependencies
The following packages are required for this repository:

### Comments, Concerns and Gripes
If you have any comments, concerns and/or gripes, please feel free to submit an issue [here][project-issues].



<!-- LINKS -->
[project-issues]: https://github.com/pkeech/Packer-PhotonOS/issues
