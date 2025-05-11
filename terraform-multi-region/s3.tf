resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "s3_east" {
  bucket   = "${var.bucket_name_prefix}-us-east-1-${random_id.bucket_suffix.hex}"
  provider = aws.east
}

resource "aws_s3_bucket" "s3_west" {
  bucket   = "${var.bucket_name_prefix}-us-west-2-${random_id.bucket_suffix.hex}"
  provider = aws.west
}

resource "aws_s3_bucket_versioning" "versioning_east" {
  bucket   = aws_s3_bucket.s3_east.id
  provider = aws.east

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "versioning_west" {
  bucket   = aws_s3_bucket.s3_west.id
  provider = aws.west

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_east" {
  bucket   = aws_s3_bucket.s3_east.id
  provider = aws.east

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_west" {
  bucket   = aws_s3_bucket.s3_west.id
  provider = aws.west

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
