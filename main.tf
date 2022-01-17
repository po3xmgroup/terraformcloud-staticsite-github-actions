terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "3xmgroup"

    workspaces {
      name = "po3xmgroup-staticsite"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "aws_codepipeline" {
  source = "./modules/aws_codepipeline"


}

module "s3_module" {
  source         = "./modules/aws_s3"
  s3_bucket_name = "s3-static-website-training"
}