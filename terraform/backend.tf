terraform {
  backend "s3" {
    bucket         = "commands-center-tf"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}