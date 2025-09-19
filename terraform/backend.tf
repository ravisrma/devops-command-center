terraform {
  backend "s3" {
    bucket         = "commands-center"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true
  }
}