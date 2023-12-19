variable "filepath" {
  description = "where your build file located"
  type        = string
  default     = "/index.html"
}

variable "aws_access_key" {
  description = "iam access key"
  type        = string
  default     = "abcd"
}

variable "aws_secret_key" {
  description = "iam secret key"
  type        = string
  default     = "abcd"
}
