terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"

}

provider "aws" {
  alias  = "west"
  region = "us-west-2"

}

