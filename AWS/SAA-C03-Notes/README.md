## SAA-C03

| Domains                                      |
| -------------------------------------------- |
| Design Resilient Architectures               |
| Design High-Performing Architectures         |
| Design Secure Applications and Architectures |
| Design Cost-Optimized Architectures          |

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

### Design Cost-Optimized Architectures

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
- Create user accounts for your administrators
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

### - S3 (Simple Storage Service)

- Object Storage
- Scalable
- Simple

S3 Basics

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

Securing your data

1. Server-side Encryption
2. Access Control Lists (ACLs)
3. Bucket Policies

- Object ACLs: Work on an individual level
- Bucket Policy: Work on an entire bucket level

_Buckets are private by default_

_Static Content: Use S3 to host static content only_

_Automatic Scaling: S3 scales automatically with demand_

Advantages of versioning

- All versions
- Lifecycle Rules
- BackUp
- Supports MFA
- Cannot Be Disable

## S3 Standard

1. High Availability and Durability

   - (>=3 AZs)
   - 99.99% Availability
   - 99.99999999999 Durability (11 9's)

2. Designed for Frequent Access
3. Suitable for Most Workloads

## S3 Standard-Infrequent Access

- Rapid Access
- You Pay to Access the Data
- Use Cases

## S3 Zone-Infrequent Access

- Cost 20% less than regular S3 Standard-IA
- Great for long-lived, infrequently accessed non-critical data

## S3 Intelligent-Tiering

Glacier and Glacier Deep Archive

- Glacier Instant Retrival
- Glacier Flexible Retrival (minutos or up 12h)
- Glacier Deep Archive (48h)

---

## ![S3StorageClasses](./images/S3StorageClasses.png)

## ![S3ExamTipsCompare](./images/S3ExamTipsCompare.png)

Lifecycle Management

- S3 Standard (Keep for 30 Days) -> S3 IA (After 30 Days) -> Glacier (After 90 Days)

Tips use Lifecycle Management

- Automates moving objects between different storages tiers
- Can be used in conjunction with versioning
- Can be applied to current versions and previous version

S3 Object Lock

- Write onces, read many (WORM model)
- Can be on individual objects or applied across the bucket as a whole.
- Comes in two mode: Governance mode and compliance mode.

  - **Compliance** a portected object version can't be overwritten or deleted by any user, incliding the root user in your AWS accoount.
  - **Governance** Users can't overwrite or delete an object version or alter its lock sttting unless they have special permissions.

Encryption in Transit

- SSL/TLS
- HTTPS

Serve-side Encryption

- SSE-S3: AES 256-bit
- SSE-KMS: Services-managed Keys
- SSE-C: Customer-provided keys

- x-amz-server-side-encryption
- Two options
- PUT Request Header

Client-side Encryption

- Encrypt the files yourselfd before you upload them to S3

S3 optimizing

- S3 Prefixes
- KMS Request rates

S3 Replication

- Replicate Objects from one bucket to another.
- Not replicated automatically.
- Delete markers are not replicated by default.

### - EC2 (Elastic Compute Cloud)

- On-Demand
  - Flexible
  - Short-term
  - Testing the Water
- Reserved
  - Predictable Usage
  - Specific Capacity Requirements
  - Pay up front
  - Standard RIs
  - Convertible RIs
  - Scheduled RIs
- Spot
  - Save up to 72%
  - Commit to 1 or 3 Years
  - Super Flexible
- Dedicated
  - Compliance
  - Licensing
  - OnDemand
  - Reserved

How computer communicate

- Linux SSH Port 22
- Windows RDP Port 2289
- HTTP Web Browsing Port 80
- HTTPS Encrypted Web BrowsingPort (SSL) 443

Security Groups

- Virtual firewalls for you EC2
- By Default, everything is blocked.
  > To let Everything in: 0.0.0.0/0
- All inbound traffic is blocked by default.
- All outbound traffic is allowed.

User data vs Metadata

- User data is a sumply bootstrap scripts.
- Megadata is data about your EC2 instances.
- You can use bootstrap scripts (user data) to access metadata.

Networking with EC2

- ENI (Elastic Network interface)
- EN (Enhanced Networking) (Speeds 10 and 100 Gbps High throughput)
- EFA (Elestic fabric Adapter) (HPC)

Placement Groups

- Cluster
- Spread
- Partition

Outpost family

- Outpost Rack
- Outpost Server

### - EBS and EFS

- Elastic Block Storage
- Storage volumes you can attach to your EC2 Instances.
- Production Workloads
- Highly Available
- Scalabe

- General Purpose SSD (gp2)
  - Suitable for boot disks and general applications
  - Up to 16.000 IOPS per Volumen
  - Up to 99.9% Durability
- General Purpose SSD (gp3)
  - Suitable for high performances applications
  - Predictable 3,000 IOPS Baseline performance and 125 MiB/s Regardless of volumen size
  - Up to 99.9% Durability
- Provisioned IOPS SSD (io1)
  - Suitable for OLTP and latency-sensitive applications
  - 50 IOPS/GiB
  - Up to 64,000 IOPS per volumen
  - High performance and most expensive
  - Up to 99.9% Durability
- Provisioned IOPS SSD (io2)
  - Suitable for OLTP and latency-sensitive applications
  - 500 IOPS/GiB
  - Up to 64,000 IOPS per volumen
  - Up to 99.999% Durability
  - Latest generation porvisiones IOPS volume
- Throughput Optimized HDD (st1)
  - Suitable for Big Data, data warehouses and ETL
  - Max throughput is 500 MB/s per Volumen
  - Cannot be a boot volume
  - Up to 99.9% Durability
- Cold HDD (SC1)
  - Max throughput is 250 MB/s per Volumen
  - Less frequently accessed data
  - Cannot be a boot volume
  - Lowest cost
  - Up to 99.9% Durability

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
- [ ] Down Size Instances EC2

### Resources

---

- [New Here?](https://www.youtube.com/playlist?list=PL9nWRykSBSFigYYU-PV7u0fn5tn_ee-iu)

- [A Cloud Guru | SAA-C03](https://learn.acloud.guru/course/certified-solutions-architect-associate)
