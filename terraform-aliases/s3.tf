# s3.tf

# uses default provider configuration
resource "aws_s3_bucket" "my_bucket" {
  bucket = "pszzech-terraform-state-east" 
  tags = {
    Name = "my-bucket"
  }
}

# alias provider specified, it will use its configuration
resource "aws_s3_bucket" "my_bucket_us_west_2" {
  bucket   = "pszzech-terraform-state-west" 
  provider = aws.us_west_2
  tags = {
    Name = "my-bucket"
  }
}
