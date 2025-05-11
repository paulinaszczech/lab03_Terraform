output "bucket_arns" {
   value = {
      "us-east-1" = aws_s3_bucket.s3_east.arn,
      "us-west-2" = aws_s3_bucket.s3_west.arn
   }
}

output "bucket_regions" {
   value = {
      "${aws_s3_bucket.s3_east.id}" = "us-east-1",
      "${aws_s3_bucket.s3_west.id}" = "us-west-2"
   }
}

