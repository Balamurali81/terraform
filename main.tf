module "east" {
  source = "./modules/lambda"
  providers = {
    aws = aws.east

  }
  region = "us-east-1"
}


module "west" {
  source = "./modules/lambda"
  providers = {
    aws = aws.west
  }
  region = "us-west-2"
}

