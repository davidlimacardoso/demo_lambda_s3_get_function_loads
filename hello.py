import boto3

def hello_function(event, context):
    print("Hello Terraform")

    try:
        print(getS3Object())
    except Exception as err:
        print(err)

def getS3Object():
    s3 = boto3.resource('s3')
    bucket = 'my-first-bucket-7507'
    obj = s3.Bucket(bucket).Object('base.json')
    getData = obj.get()
    s3data = getData['Body'].read().decode()
    return s3data

