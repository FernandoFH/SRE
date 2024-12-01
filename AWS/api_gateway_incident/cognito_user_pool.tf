resource "aws_cognito_user_pool" "incident_user_pool" {
  name = "IncidentUserPool"

  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
    mutable             = false
  }

  auto_verified_attributes = ["email"]
}

resource "aws_cognito_user_pool_client" "incident_user_pool_client" {
  name         = "IncidentAppClient"
  user_pool_id = aws_cognito_user_pool.incident_user_pool.id
  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
  ]
  generate_secret = false
}

output "cognito_user_pool_arn" {
  value = aws_cognito_user_pool.incident_user_pool.arn
}
