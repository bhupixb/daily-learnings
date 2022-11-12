#!/usr/bin/env python3

"""
    Export your AWS keys in env like:
        export AWS_SECRET_ACCESS_KEY="<secret-key>"
        export AWS_ACCESS_KEY_ID="<key-id>"
    and run like
    $ python3 <file>
    $ chmod u+x <file> && ./<file>
"""

# Tested on boto version `boto3==1.17.22`

import boto3
import json

s3 = boto3.resource('s3')

BUCKET_NAME = 'my-s3-bucket'
FILE_NAME = 'dir1/dir2/file.json'

content_object = s3.Object(BUCKET_NAME, FILE_NAME)

file_content = content_object.get()['Body'].read().decode('utf-8')

# [Optional] Only works if file content is valid json.
json_content = json.loads(file_content)

print(json_content)
