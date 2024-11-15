module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "tf-test-website-jyy15-123"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
