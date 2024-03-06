data "aws_caller_identity" "current" {}

data "aws_iam_session_context" "current" {
  arn = data.aws_caller_identity.current.arn
}


# data "aws_s3_bucket" "s3_bucket" {
#     bucket = var.bucket_register
  
# }