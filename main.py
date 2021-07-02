import base64
import json


def handle_request(path, headers, body):
    return 200, {'message': f"Hello world from {path}"}


def lambda_main(event, context):
    path = event['rawPath']
    if 'body' in event:
        if event['isBase64Encoded']:
            body = base64.b64decode(event['body'])
        else:
            body = event['body']
    else:
        body = None

    status_code, response = handle_request(path, event['headers'], body)

    return {
        'statusCode': status_code,
        'headers': {
            'Content-Type': "application/json",
        },
        'body': json.dumps(response),
        'isBase64Encoded': False,
    }
