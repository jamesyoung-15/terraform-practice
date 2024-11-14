output "aws_s3_bucket" {
  value = "Bucket named: ${aws_s3_bucket.my-test-bucket.bucket} created."
}