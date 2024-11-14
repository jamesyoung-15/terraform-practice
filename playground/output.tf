output "hello-world" {
  value = "Hello, World!"
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.my-test-bucket.bucket
}