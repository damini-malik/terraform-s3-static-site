
provider "aws" {
	region = "ap-south-1"
}

resource "aws_s3_bucket" "static_site" {
	bucket = "my-terraform-static-site-bucket-12345"

website {
	index_document = "index.html"
	error_document = "error.html"
	}
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
	bucket = aws_s3_bucket.static_site.id
	
	rule {
	object_ownership = "BucketOwnerEnforced"
	}
}

resource "aws_s3_bucket_public_access_block" "public_access" {
	bucket 		    	= aws_s3_bucket.static_site.id
	block_public_acls   	= false
	block_public_policy 	= false
	ignore_public_acls  	= false
	restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read_policy" {
	bucket = aws_s3_bucket.static_site.id

policy = jsonencode({
	Version = "2012-10-17"
	Statement = [
	{
	Sid	  = "PublicReadGetObject"
	Effect	  = "Allow"
	Principal = "*"
	Action	  = "s3:GetObject"
	Resource  = "${aws_s3_bucket.static_site.arn}/*"
	}
      ]
  })
depends_on = [aws_s3_bucket_public_access_block.public_access]
}

resource "aws_s3_bucket_object" "index" {
	bucket = aws_s3_bucket.static_site.id
	key = "index.html"
	source = "index.html"
	content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
	bucket = aws_s3_bucket.static_site.id
	key = "error.html"
	source = "error.html"
	content_type = "text/html"
}

output "website_url" {
	value = aws_s3_bucket.static_site.website_endpoint
}

