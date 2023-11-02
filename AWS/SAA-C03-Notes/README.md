## SAA-C03

|Domains | 
|----    |
| Design Resilient Architectures |	
| Design High-Performing Architectures | 
| Design Secure Applications and Architectures | 
| Design  Cost-Optimized Architectures |

### Design Resilient Architectures
- Design multier Architectures
- Highly available and/or fault-tolerant
- Decoupling mechanisms
- Apporpriate Resilient

### Design High-Performing Architectures
- Elastic and scalable compute
- High-performing and scalabale storage
- High-performing networking solutions
- High-performin solutions

### Design Secure Applications and Architectures
- Secure Access
- Secure Aplication tiers
- Appropirate data security options

### Design  Cost-Optimized Architectures
- Storage Solutions
- Computo and database services
- Network Architecture

### - AWS Fundamentals 
 - AWS Global infrastructure
   31 Regions (2 o more AZ)
   99 Availability Zone (Data Centers)

![Region & AZ](./images/Region_AZ.png)

 - Edge Locations
 - The AWS Management Console
 - A region is a physical location in the world that consists of two or more Availability Zone (AZs). 
 - An AZ is one or more dicrete data centers - each with redundant power, networking, and connectivity - housed is separete facilites. 
 - Edge locations are endpoints for AWS that are used for caching content. Typically, this consists of CloudFront, Amazon's CDN.
 - The shared responsibility model

#### - Compute
- EC2
- Lambda
- Elastic Beanstalk 
#### - Storage
- S3
- EBS
- EFS
- FSx
- Storage Gateway
#### - Databases
- RDS
- DynamoDB
- Redshift
#### - Networking
- VPCs
- Direct Connect
- Route 53
- API Gateway
- AWS Global Acelerator 

#### Wel-Architected Framework
- Operation Excellence
- Performance Efficiency
- Security
- Reliability
- Cost Optimization
- Sustainability

### - IAM 
- Create users and grant permissions to those users 
- Create groups and roles 
- Control access to AWS resources
- Enable multi-factor Authentication on the root account 
- create an admin group for youy administrators, and assign the approprite permissions to this group
-  Create user accounts for your administrators 
- Add your users to the admingroup

### IAM Policy 
- Foramte JSON 
- Example of a Policy document 

##### - IAM POLICY DOCUMENTS 
          - Groups: Functions, Contains users
          - Users: A physical person
          - Roles: Internal usage within AWS    
Effect \ Action \ Resource

##### The Principle of Least Privilege 

- IAM is Universal 

### - S3 
- Object Storage 
- Scalable 
- Simple 

Basics 
- Unlimited Storage 
- Objects up to 5TB in Size 
- S3 Buckets

Working 
- Universal Namespace 
- S3 Urls 
- Uploading Files 
- Built for Availability (99.95% - 99.99%)
- Designed For Durability (99.99%) 9decimales mas

Securing 
- Server-side Encryption 
- Access Control Lists (ACLs)
- Bucket Policies

Key-value Store 
- Key 
- Value
- Version ID
- Metadata 

_S3 is a safe place to store your files_. 

S3 Standard 
  1. High Availability and Durability 
      - 99.99% Availability
      - 99.99999999999  Durability (11 9's)
  2. Designed for Frequent Access
  3. Suitable for Most Workloads 

Securing your data 
  1. Server-side Encryption 
  2. Access Control Lists (ACLs)
  3. Bucket Policies

* Object ACLs: Work on an individual level
* Bucket Policy: Work on an entire bucket level

_Buckets are private by default_

_Static Content: Use S3 to host static content only_

_Automatic Scaling: S3 scales automatically with demand_ 

Advantages of versioning 
- All versions 
- Lifecycle Rules 
- BackUp 
- Supports MFA 
- Cannot Be Disable

S3 Standard-Infrequent Access 
- Rapid Access 
- You Pay to Access the Data 
- Use Cases 

S3 Intelligent-Tiering 
Glacier and Glacier Deep Archive
- Glacier Instant Retrival 
- Glacier Flexible Retrival (minutos or up 12h)
- Glacier Deep Archive (48h)

Lifecycle Management 
- S3 Standard (Keep for 30 Days) -> S3 IA (After 30 Days) -> Glacier (After 90 Days)

Encryption in Transit 
- SSL/TLS
- HTTPS

Serve-side Encryption 
- SSE-S3: AES 256-bit 
- SSE-KMS: Services-managed Keys 
- SSE-C: Customer-provided keys

Client-side Encryption
- Encrypt the files yourselfd before you upload them to S3 

S3 Replication 

### - EC2 
### - EBS and EFS 
### - Databases 
### - VPC Networking 
### - Route 53 
### - Elastic Load Balancing 
### - Security 
### - AI amd ML 
### - Media 
### - Monitoring 
### - High availability and scaling 
### - Decoupling workflows 
### - Big data
### - Serverless architecture 
### - Automation 
### - Caching 
### - Governance
### - Migration
### - Well-Architected
  - Operational Excellence 
  - Security
  - Reliability 
  - Performace Efficiency
  - Cost Optimization  

    - Implement cloud financial mangement 
    - Adopt consumption model 
    - Measure overall efficiency 
    - Stop spending money on undifferentiated lifting 
    - Analyze and attribute expenditure    


### Practical Projects to learn AWS
---
  - [ ] Static Website Hosting on S3 (Route53/CloudFront/S3)
  - [ ] Create Policy own reset password (IAM)
  - [ ] CRUD APP Using ECS + LoadBalancing (Route53/LB/ECS/ECR/VPC/RDS-MySql)
  - [ ] API Hosting (Route53/Api Gateway/Lambda)
  - [ ] Data Processing Pipeline Twitter (Kinesis/S3/Lambda/ElasticSearch/Kibana)
  - [ ] Distributed Serverless Workflow for Stock Proce Movements (Yahoo!/CloudWatch/SQS/Lambda/DynamoDB/Lambda/SES)
  - [ ]  Down Size Instances EC2 
  - [ ]   Mult-Tier, Highly Available, Fault-Tolerant Web App  [Tutorial](https://catalog.workshops.aws/general-immersionday/en-US/advanced-modules)
  
### Resources 
____
- [New Here?](https://www.youtube.com/playlist?list=PL9nWRykSBSFigYYU-PV7u0fn5tn_ee-iu)

- [A Cloud Guru | SAA-C03](https://learn.acloud.guru/course/certified-solutions-architect-associate)



