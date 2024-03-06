
resource "aws_lakeformation_data_lake_settings" "lf_data_lake_admin" {
  count = 1
   admins = [ data.aws_caller_identity.current.arn]
}


resource "aws_lakeformation_resource" "aws_lf_resource_register" {
  count = 1

  arn = var.bucket_register

  depends_on = [ aws_lakeformation_data_lake_settings.lf_data_lake_admin]
}


resource "aws_lakeformation_permissions" "aws_lf_permissions" {
  for_each = { for idx, details in var.lf_permissions : idx => details if length(var.lf_permissions) > 0 }

    permissions = [ for permission in each.value.lake_permissions: permission ]
    principal = var.glue_arn
    
    database {
      name =  each.value.db_name
    }

  depends_on = [ aws_lakeformation_data_lake_settings.lf_data_lake_admin, aws_lakeformation_resource.aws_lf_resource_register ]
}

