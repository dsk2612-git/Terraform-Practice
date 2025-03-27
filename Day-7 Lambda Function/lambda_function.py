import json
import boto3

def lambda_handler(even,context):
  client = boto3.client('ec2')
  response = client.run_instance(
    ImageId="ami-0b7207e48d1b6c06f",
    InstanceType="t2.micro",
    KeyName="democp",
    MaxCount=1,
    MinCount=1
  )