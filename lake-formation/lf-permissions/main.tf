
resource "aws_lakeformation_permissions" "aws_lf_permissions" {
    permissions = [ for permission in var.lake_permissions: permission ]
    principal = var.principle_arn
    
    database {
      name =  var.db_name
    }

}

