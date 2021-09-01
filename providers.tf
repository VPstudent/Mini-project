terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.34.0,<=3.35.0"
    }
  }
}

provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAXGVXQSFL5N6QAYRJ"
  secret_key = "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"
  profile    = "default"
}