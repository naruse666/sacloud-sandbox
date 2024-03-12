terraform {
  required_providers {
    sakuracloud = {
      source = "sacloud/sakuracloud"

      version = "2.25.3"
    }
  }
}
# Configure the SakuraCloud Provider
provider "sakuracloud" {
  zone = "is1a"
}

data "sakuracloud_zone" "current" {}

output "zone" {
  value = data.sakuracloud_zone.current.id
}
