import json

def lambda_handler(event, context):
    # Verificar que el método HTTP sea POST
    if event['httpMethod'] != 'POST':
        return {
            "statusCode": 405,
            "body": json.dumps({"message": "Only POST method is allowed"})
        }

    # Intentar extraer el parámetro 'message' del cuerpo de la solicitud
    try:
        body = json.loads(event['body'])
        message = body.get('message', '')
        
        if message.lower() == 'chao':
            return {
                "statusCode": 200,
                "body": json.dumps({"response": "Chao tú!"})
            }
        else:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "El mensaje no es 'Chao'"})
            }
    except json.JSONDecodeError:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "El cuerpo de la solicitud no es un JSON válido"})
        }