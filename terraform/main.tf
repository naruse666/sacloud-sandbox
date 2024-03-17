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

resource "sakuracloud_server" "foobar" {
  name        = "foobar"
  disks       = [sakuracloud_disk.foobar.id]
  description = "description"
  tags        = ["tag1", "tag2"]

  disk_edit_parameter {
    hostname        = "hostname"
    password        = "password"
    disable_pw_auth = true
  }
}

data "sakuracloud_archive" "ubuntu" {
  os_type = "ubuntu2004"
}

resource "sakuracloud_disk" "foobar" {
  name              = "{{ .arg0 }}"
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}
