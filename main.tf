terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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