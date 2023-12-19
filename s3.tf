resource "aws_s3_bucket" "test" {
  bucket = "test-s3-cloudfornt"
}

resource "aws_s3_bucket_acl" "test" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
}

resource "aws_s3_object" "test" {
  bucket = aws_s3_bucket.test.id
  key    = "test_object_key"
  source = var.filepath
  etag   = filemd5(var.filepath)
}

resource "aws_s3_bucket_policy" "cloudfront_oac_policy" {
  bucket = aws_s3_bucket.test.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
