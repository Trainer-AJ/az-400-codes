terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.7.0"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "example" {
  name        = "terraform-Learning"
  description = "This repository was created by using Github provider of terraform"

  visibility  = "public"

}
