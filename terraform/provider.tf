terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {

  pm_api_url = "https://192.168.18.4:8006/api2/json"

  pm_tls_insecure = true

  pm_user = var.pm_user

  pm_api_token_id = var.pm_token_id

  pm_api_token_secret = var.pm_token_secret
}
