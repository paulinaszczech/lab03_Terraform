# modules/s3_bucket/outputs.tf

output "bucket_id" {
  description = "ID utworzonego bucketu S3"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN utworzonego bucketu S3"
  value       = aws_s3_bucket.this.arn
}

output "bucket_region" {
  description = "Region AWS, w którym został utworzony bucket"
  value       = var.region
}
