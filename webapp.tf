module "app" {
    source = "./webapp_deployment"
    application_name = "example-webapp"
    application_version = "7ffd6af"
    artifact_bucket = "iouri-aws-bucket"
    worker_ami = "ami-0ec7f9846da6b0f61"
    instance_profile = "test_profile"
    backend_port = 8080
    subnets = [
    {
      az     = "eu-central-1a",
      prefix = "10.1.1.0/24"
    },
    {
      az     = "eu-central-1b",
      prefix = "10.1.2.0/24"
    }
  ]
}
