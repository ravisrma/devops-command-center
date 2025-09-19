import boto3
import yaml
from app.core.config import settings

def load_commands_from_s3():
    session = boto3.Session(
        aws_access_key_id=settings.aws_access_key_id,
        aws_secret_access_key=settings.aws_secret_access_key,
        region_name=settings.aws_region
    )
    s3 = session.client('s3')
    obj = s3.get_object(Bucket=settings.s3_bucket, Key=settings.s3_key)
    commands_yaml = obj['Body'].read().decode('utf-8')
    return yaml.safe_load(commands_yaml)