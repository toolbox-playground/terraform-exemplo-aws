provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "example-s3-toolbox" {
    bucket = var.bucket_name

    tags = {
      Name = "Toolbox-Playground-AWS-2"
    }
}

resource "aws_s3_bucket_public_access_block" "example-s3-toolbox" {
  bucket = aws_s3_bucket.example-s3-toolbox.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "example-s3-toolbox" {
  bucket = aws_s3_bucket.example-s3-toolbox.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_website_configuration" "example-s3-toolbox" {
  bucket = aws_s3_bucket.example-s3-toolbox.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}


