import json

def lambda_handler(event, context):

    record = event['Records'][0]

    bucket = record['s3']['bucket']['name']
    key = record['s3']['object']['key']

    print(f"File uploaded to {bucket}: {key}")

    return {
        'statusCode': 200,
        'body': json.dumps('File processed!')
    }