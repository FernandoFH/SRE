### AWS CLI 
-----
 - aws configure 
 - aws sts get-caller-identity

#### EC2 
 - aws ec2 create-key-pair --key-name MyNewKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

 - aws ec2 describe-key-pairs