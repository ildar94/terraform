terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {

  service_account_key_file = file("~/yandex-cloud/bin/key.json")
  cloud_id                 = "b1gr27oeeco1vfn5thoc"
  folder_id                = "b1guk00v81akh4ab7ab9"
  zone                     = "ru-central1-b"
}


resource "yandex_compute_instance" "web" {

  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8movi7o1ofl59h1uu9"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}",
    user-data = "${templatefile("meta.sh.tpl",{
      f_name = "Ildar"
      l_name = "Gilyazev"
      names = ["Ivan", "Nikolay", "Roman", "Olya", "Dasha"]
    })}"  
  }
  lifecycle {
    prevent_destroy = true
  }
}



resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}


resource "yandex_dns_zone" "zone1" {
  name        = "example-zone-1"
  description = "Public zone"
  zone        = "testlemp.com."
  public      = true
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "www"
  type    = "CNAME"
  ttl     = 200
  data    = ["testlemp.com."]
}

output "web_id" {
  value = yandex_compute_instance.web
}