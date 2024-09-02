variable "version" {
  type    = string
  default = "0.0.1"
}
variable "arch" {
  type    = string
  default = "amd64"
}
variable "platform" {
  type    = string
  default = "linux"
}


variable "repo_folder" {
  type    = string
  default = "securebaseimages"
}

packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1"
    }
  }
}

source "docker" "build" {
  image         = "cgr.dev/chainguard/wolfi-base:latest"
  platform      = "${var.platform}/${var.arch}"
  # commit        = true
  export_path   = "tn-wolfios-${var.arch}.tar"
}

build {
  sources = [
    "source.docker.build",
  ]

  provisioner "shell" {
    inline = [
      "apk update",
      "apk add --no-cache bash busybox curl glibc-locale-en icu-dev libunwind-dev ncurses-dev tzdata zlib-dev libuuid libstdc++ libssl3 openssl openssl-config openssl-dev openssl-doc dumb-init wget",
      "adduser -D -u 1000 -g 0 appuser",
      "chown -R appuser:0 /home/appuser && chmod -R g=u /home/appuser",
      "cp /usr/share/zoneinfo/Turkey /etc/localtime"
    ]
  }

  post-processors {
    post-processor "docker-import" {
      repository          = "${var.container_registry}/${var.repo_folder}/tn-wolfios"
      tag                 = "${var.version}"
      platform            = "${var.platform}/${var.arch}"
      keep_input_artifact = true
    }
  }
}
