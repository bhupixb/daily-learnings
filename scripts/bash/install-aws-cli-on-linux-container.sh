#!bin/bash

set -xe

mkdir /tmp/aws && cd /tmp/aws

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

./aws/install -i /tmp/aws/aws-cli -b /tmp/aws/bin

# Usage
# /tmp/aws/bin/aws s3 ...
