resource "aws_s3_bucket" "test" {
  bucket = "test-s3-cloudfornt"
}

resource "aws_s3_bucket_acl" "test" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
}

resource "aws_s3_object" "test" {
  for_each = { for f in fileset("${path.module}/dist", "**/*") : f => f }

  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "${path.module}/${var.filepath}/${each.value}"
  etag   = filemd5("${path.module}/${var.filepath}/${each.value}")
}

resource "aws_s3_bucket_policy" "cloudfront_oac_policy" {
  bucket = aws_s3_bucket.test.id
  policy = data.aws_iam_policy_document.s3_oac_policy.json
}
