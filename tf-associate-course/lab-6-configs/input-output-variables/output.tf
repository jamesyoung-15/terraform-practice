output "bucket_name" {
  value = "${aws_s3_bucket.test-bucket.bucket}"
}

output "test-sensitive" {
  sensitive = true
  value = "This is a sensitive output"
}

output "tags" {
  value = {
    Name = "${aws_s3_bucket.test-bucket.tags.Name}"
    Environment = "${aws_s3_bucket.test-bucket.tags.Environment}"
  }
}