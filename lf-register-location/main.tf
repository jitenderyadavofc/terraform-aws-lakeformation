
resource "aws_lakeformation_data_lake_settings" "lf_data_lake_admin" {
   admins = [ data.aws_caller_identity.current.arn]
}


resource "aws_lakeformation_resource" "aws_lf_resource_register" {
  arn = var.bucket_register

  depends_on = [ aws_lakeformation_data_lake_settings.lf_data_lake_admin]
}

