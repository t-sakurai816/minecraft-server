terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = "minecraft.server.backend.sakudev.net"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "myAccount"
}
