# Policies
# -----------------------------------------------------------
resource "aws_s3_bucket_policy" "media_bucket_policy" {
  bucket = aws_s3_bucket.media.bucket
  policy = data.aws_iam_policy_document.allow_public_access_to_s3_bucket.json
}

data "aws_iam_policy_document" "allow_public_access_to_s3_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.media.arn}/*"]

    principals {
        type        = "AWS"
        identifiers = ["*"]
    }
  }
}

# Buckets
# -----------------------------------------------------------
resource "aws_s3_bucket" "media" {
  bucket = "${var.project_name}-media"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.media.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
