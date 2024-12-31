terraform {
  backend "local" {
    path = "./frontend-terraform.tfstate"
  }
}
