# modules/s3_bucket/variables.tf

variable "bucket_name_prefix" {
  description = "Prefix dla nazw S3 bucketów"
  type        = string
}

variable "region" {
  description = "Region AWS, w którym tworzony jest bucket"
  type        = string
}

variable "random_suffix" {
  description = "Losowy suffix dla unikalnych nazw bucketów"
  type        = string
}

variable "lifecycle_days" {
  description = "Liczba dni przed przeniesieniem obiektów do Glacier"
  type        = number
  default     = 90
}

variable "lifecycle_storage_class" {
  description = "Klasa przechowywania lifecycle dla S3"
  type        = string
  default     = "GLACIER"
}
