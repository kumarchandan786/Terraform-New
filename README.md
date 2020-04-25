# Terraform-New
1. To assign one resource  value in to another resource we are using interpolation Syntax
  Example:- we are assiging aws_secuity_group ID to aws_instance
        SYNTAX:- "${TYPE.NAME.ATTRIBUTE}"
                a."${aws.security_group.network.id}" 
