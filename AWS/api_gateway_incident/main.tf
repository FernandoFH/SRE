provider "aws" {
  region  = "us-east-1" # Cambia esto a la región que estés usando
  profile = "fernando_demo"
}

resource "aws_api_gateway_rest_api" "incident_api" {
  name        = "IncidentAPI"
  description = "API Gateway para gestionar incidentes"
}

resource "aws_api_gateway_resource" "crear_incidente" {
  rest_api_id = aws_api_gateway_rest_api.incident_api.id
  parent_id   = aws_api_gateway_rest_api.incident_api.root_resource_id
  path_part   = "crear-incidente"
}

resource "aws_api_gateway_resource" "cerrar_incidente" {
  rest_api_id = aws_api_gateway_rest_api.incident_api.id
  parent_id   = aws_api_gateway_rest_api.incident_api.root_resource_id
  path_part   = "cerrar-incidente"
}

# Autenticación con Cognito
resource "aws_api_gateway_authorizer" "cognito_authorizer" {
  rest_api_id     = aws_api_gateway_rest_api.incident_api.id
  name            = "CognitoAuthorizer"
  type            = "COGNITO_USER_POOLS"
  identity_source = "method.request.header.Authorization"
  provider_arns   = [aws_cognito_user_pool.incident_user_pool.arn]
}

# API Gateway Method for crear incidente
resource "aws_api_gateway_method" "crear_incidente_method" {
  rest_api_id   = aws_api_gateway_rest_api.incident_api.id
  resource_id   = aws_api_gateway_resource.crear_incidente.id
  http_method   = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito_authorizer.id
  request_models = {
    "application/json" = "Empty"
  }
}

# API Gateway Method for cerrar incidente
resource "aws_api_gateway_method" "cerrar_incidente_method" {
  rest_api_id   = aws_api_gateway_rest_api.incident_api.id
  resource_id   = aws_api_gateway_resource.cerrar_incidente.id
  http_method   = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito_authorizer.id
  request_models = {
    "application/json" = "Empty"
  }
}

# Integration with Lambda - Crear incidente
resource "aws_api_gateway_integration" "crear_incidente_integration" {
  rest_api_id             = aws_api_gateway_rest_api.incident_api.id
  resource_id             = aws_api_gateway_resource.crear_incidente.id
  http_method             = aws_api_gateway_method.crear_incidente_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.crear_incidente_function.invoke_arn
}

# Integration with Lambda - Cerrar incidente
resource "aws_api_gateway_integration" "cerrar_incidente_integration" {
  rest_api_id             = aws_api_gateway_rest_api.incident_api.id
  resource_id             = aws_api_gateway_resource.cerrar_incidente.id
  http_method             = aws_api_gateway_method.cerrar_incidente_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.cerrar_incidente_function.invoke_arn
}

# Permisos para que API Gateway invoque las Lambdas
resource "aws_lambda_permission" "apigw_lambda_create" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.crear_incidente_function.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "apigw_lambda_close" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cerrar_incidente_function.function_name
  principal     = "apigateway.amazonaws.com"
}

# Deployment de la API Gateway
resource "aws_api_gateway_deployment" "incident_api_deployment" {
  depends_on = [
    aws_api_gateway_method.crear_incidente_method,
    aws_api_gateway_method.cerrar_incidente_method,
  ]
  rest_api_id = aws_api_gateway_rest_api.incident_api.id
  stage_name  = "prod" # Cambia el nombre de la etapa si es necesario
}

# Lambda para Hola
resource "aws_lambda_function" "hola_function" {
  filename      = "./hola_lambda_function.zip" # Ruta local al archivo .zip
  function_name = "hola_function"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
}

# Lambda para Chao
resource "aws_lambda_function" "chao_function" {
  filename      = "./chao_lambda_function.zip" # Ruta local al archivo .zip
  function_name = "chao_function"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
}

# Salida de la URL de la API
output "api_url" {
  value = aws_api_gateway_deployment.incident_api_deployment.invoke_url
}
