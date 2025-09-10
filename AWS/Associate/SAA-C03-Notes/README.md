### SAA-C03

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
  **Nombre de las instancias**
- Familia o tipo general
- Generación del procesador utilizado.
- Cracterísticas específicas del procesador (opcional)
- Punto seguido del tamaño

**Ciclo de vida de una instancias**
![LifeCycleEC2](./images/LifeCycleEC2.png)

**Amazon Machine Images (AMIs):** son plantillas que contienen la configuración de software necesaria para lanzar instancias.

```bash
# Ejemplo de creación de AMI desde una instancia existente
aws ec2 create-image --instance-id i-1234567890abcdef0 --name "Mi-AMI-Personalizada" --description "AMI para servidores web"
```

**Launch Templates**

```bash
# Ejemplo de creación de Launch Template
aws ec2 create-launch-template --launch-template-name MiTemplate --version-description "Versión 1" --launch-template-data file://config.json
```

**Placement Groups** determinan cómo se distribuyen físicamente nuestras instancias EC2 en la infraestructura subyacente de AWS

![PlacementGroup](./images/PlacementGroup.png)

```bash
# Ejemplo de creación de un Placement Group tipo Cluster
aws ec2 create-placement-group --group-name MyClusterPG --strategy cluster
```

**Tenancy**, EC2 ofrece tres opciones:

- Shared Tenancy (Default): Múltiples clientes comparten el mismo hardware físico
- Dedicated Instances: Instancias que se ejecutan en hardware dedicado a un solo cliente
- Dedicated Hosts: Servidor físico completo dedicado a un solo cliente, con visibilidad de sockets y cores

### Networking en EC2

- Elastic Network Adapter (ENA)

  - Ancho de banda de hasta 100 Gbps
  - Menor latencia
  - Mayor rendimiento de paquetes por segundo (PPS)
  - Menor utilización de CPU

- Elastic Network Interface (ENI)
  - Cada instancia tiene una ENI primaria que no se puede desconectar
  - Puedes crear ENIs adicionales y conectarlas a tus instancias
  - Las ENIs permanecen incluso si la instancia se termina
  - Pueden moverse entre instancias (útil para failover)

```bash
# Ejemplo de creación de una ENI
aws ec2 create-network-interface --subnet-id subnet-12345abc --description "Mi ENI secundaria"
```

- Elastic Fabric Adapter (EFA)

  - Proporciona comunicación entre instancias de baja latencia
  - Utiliza "OS-bypass" para comunicación directa con el hardware
  - Esencial para aplicaciones HPC y machine learning
  - Compatible con la interfaz de paso de mensajes (MPI)

### AWS Outpost

Permite ejecutar aplicaciones y servicios de AWS directamente en las instalaciones propias, ofreciendo latencia ultra baja y gestión unificada. A través de Outpost se tienen dos opciones principales:

**Servidores Outpost:**
**Una unidad de rack:** con procesadores Graviton, proporciona 64 CPU virtuales, 128 GB de RAM y 4 TB de almacenamiento.
**Dos unidades de rack:** utiliza procesadores Intel y duplica la capacidad.

### Elastic Beanstalk

El despliegue rápido y efectivo de aplicaciones web iniciales es fundamental para cualquier proyecto tecnológico. AWS Elastic Beanstalk facilita esta tarea permitiendo desplegar y administrar aplicaciones sin preocuparse excesivamente por la infraestructura subyacente y otros detalles técnicos.

### Contenedores vs. Máquinas Virtuales

![ContenedoresVM](./images/ContenedoresVM.png)

- Lambda

- Batch
- Outpost

- Propósito general: Chip Graviton, procesador creado por AWS para tareas comunes.
- Específicos o aceleradores: Tranium para entrenamiento de inteligencia artificial e Inferentia para inferencia en modelos de aprendizaje automático.

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

- IGW
- NACL
- Subnet
- NAT Gateway
- EIP
- Route Table
- SG

- CIDR: Classless Inter-Domain Routing (CIDR) is a compact way to write IP address ranges and their network masks.

Las 5 IPs que AWS reserva y por qué?

AWS reserva automáticamente 5 direcciones IP en cada subred para su propio uso interno:

10.0.0.0 → Identificador de red
10.0.0.1 → Gateway de la VPC
10.0.0.2 → Servidor DNS de AWS
10.0.0.3 → Reservada para uso futuro
10.0.0.255 → Dirección de broadcast (aunque no se usa, está reservada)

**CIDR Blocks**

- Cada VPC se define mediante un bloque CIDR (Classless Inter-Domain Routing):

- Define el rango de direcciones IP disponibles
- Utiliza notación x.x.x.x/y donde /y es la máscara de red
- Tamaño mínimo: /28 (16 direcciones IP)
- Tamaño máximo: /16 (65,536 direcciones IP)

Estas direcciones no las podemos usar en nuestras instancias ni servicios

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

## ![S3 Levels](./images/LevelsS3.png)

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

- **EFS (Amazon Elastic File System)**

  - Managed NFS (Network file system) that can be mounted on many EC2 instances.
  - EFS works with EC2 instances in multiple Avalaibility Zones.
  - Highly available and scalable: however, it is expensive.

  - Uses NFSv4 Protocol
  - Windows not supported at this time
  - Encryption at rest using KMS
  - Scales automatically

  - 1000s Concurrent connections
  - 10 Gbps Throughput
  - Petabytes Scaling

- **FSx**

  - Is built on windows Server

- **AWS BackUp**
  - Central Management
  - Automation
  - Improved Compleance

### - Databases

- RDS
- RDS is for OLTP Workloads

#### Data Base Engine

- SQL Server
- Oracle
- MySql
- Amazon Aurora
- Maria DB
- PostgresSQL

#### OLTP vs OLAP

- Online Transaction Processing (OLTP)
  - Trassaccional in real Time
- Online Analytical Processing (OLAP)

  - Complex Querys analize

- Multi-AZ
  - An Axact copy of your porduction database in another Available zone.
  - Used for diaster recovery
  - In the event of a failure, RDS will automatically fail over to the Stanby instance.
- Read Replica
  - A read-only copy of your promary database in the same AZ
  - Used to increase or scale read performance
  - Great fot read-heavy workloads and takes the load off primary database.

#### Amazon Aurora

- Database relacional
- 2 Copies of your data are contained in each AZ, with min 3 AZ. 6 Copies of your data.
- You can share Aurora snapshots with Other AWS Account
- 3 Types of repplicas available: Aurora, MySql, PostgresSQL

#### DynamoDB

- NoSQL database
- Sopports document and key-value data models.
- Eventually consistent reads (Default)
- DynamoDB Point-in-time Recovery(PITR)
  - Restore to any point in the last 35 Days
  - No enable by befault

#### Atomic - Consistent - Isolated - Durable

#### DocumentDB

- NoSql Database

#### Amazon Keysapces

- Amazon's Apache cassadra database service.
- Keysapces is serverless.

#### Amazon Neptune

- Graph Database

#### Quantum Ledger Database (QLDB)

- Ledger database: immutable, trasparent and has cryptographically

#### Analyzing Time-series Data (Amazon Timestream )

- IoT
- Analytics
- DevOps Applications

### - VPC Networking

- Virtual data center in the cloud
- Isolated part AWS cloud
- Fully cumtomizable network

![VPC Componets](./images/VPC_Componets.svg)

- NAT gataways

  - Network Address traslation
  - Redundant inside the AZ
  - Start at 5Gbps and scale currently to 45 Gbps
  - No need to patch
  - Not associated with security groups
  - Automatically assigned a public IP Address

- Security Groups

  - Virtual Firewalls for an EC2 Instance.
  - By default, everything is bloked.
  - SG are statefull

- Network ACLs

  - The first line of defense
  - A network access control list
  - By default it allows all traffic.
  - Block Ip address using ACLs Not SG.
  - ACLs are stateless

- VPC Endpoints

  - Option 1: Interfaces Endpoint
  - Option 2: Gataway Endpoint (S3 and DynamoDB)

- VPC Peering

  - Allows yoy to connet 1 VPC with another
  - Transitive peering is not supported
  - No overlapping CIDR address ranges

- PivateLink
  - Doesn't require VPC peering, no route table, Nat etc
  - Requires a Network Load Balance on the service VPC and an ENI on customer VPC

### - Route 53

- DNS

  - Computer use DNS to convert domain names into IP Addresses.

  - IPv4 - 32 Bits
  - IPv6 - 128 Bits

- Record
- TTL
- CNAME (Canonical name)

- Route 53 (7 Routing Policies Avalable)

  - Simple Routing
  - Weighted Routing
  - Latancy-Based Routing
  - Failover Routing
  - Geolocation Routing
  - Geoproximity Routing (Traffic Flow Only)
  - Multivalue Answer Routing

- Elastic Load Balancing
  - Application Load Balancer (7 HTTP/HTTPS) - Webs Apps, Microservices, Content-Based Routing
  - Network Load Balancer - (4 TCP/UDP) - High-performance, Low-latency, gaming, Real-time System.
  - Gataway Load Balancer - (3/4) - Deploying and scaling third-part virtual app like firewalls, detection/prevertion system
  - Classic Load Balancer - Support both HTTP/HTTPS layer 7 nad TCP Layer 4

### - Elastic Load Balancing

- Application Load Balancer

  - Balancing HTTP and HTTPS Trafic
  - Operate at layer 7
  - Inteligent Load Balancer

  - Listeners
  - Rules
  - Target Groups

  - Only support HHTP and HTTPS

- Network Load Balancer

  - Operate at layer 4
  - Performance Load Balancer

  - Listeners
  - Target Groups

- Gataway Load Balancer

  - Operate at layer 3
  - For inline Virtual Appliance Load Balancig

- Classic Load Balancer

  - Operate at layer 4/7
  - Classic/Test/Dev Load Balancer
  - Legacy Load Balancer

- Health Checks

  - Use route traffic to instances or traget that are healthy

- Campare ELB

![Compare LB](./images/Compare_ELB.png)

### - Monitoring

- CloudWatch

  - System Metrics
  - Application Metrics
  - Alarms

  - Log Event
  - Log Stream
  - Log Group

  - Filter Patterens
  - CloudWatch Logs Insights
  - Alarms

- Managed Grafana

  - Container Metric Visualizations
  - Internet of Things
  - Troubleshooting

- Managed Service for Pormnetheus
  - Automatic Scaling
  - Open-Source Pormetheus
  - Desingned for High Availability
  - Choose your Kubernetes
  - PromQl
  - Data Retention

### - High availability and scaling

- Vertical
- Horizontal

- The 3 W's of Scaling

  - What do we sacale?
  - Where do we scale?
  - When do we scale?

- Auto Sacaling Step

  - Define Template
  - Networking amd Purchasing
  - ELB Configuration
  - Set Scaling Policies
  - Notifications

- Auto Scaling Retrictions

  - Minumun
  - Maximun
  - Desired

- Lifecycle Hooks

![Lifecycle Hooks](./images/LifecycleHooks.png)

1. EC2 instance gets launched by EC2 Auto Scaling group

2. WAIT state is entered via the Lifecycle Hooks capability

3. While in the WAIT state, the instance runs a custom script via EC2 user data to install a proprietary application

4. Script install and configure application

5. Once the application is validated to be working correctly, the instance sends a complete-lifecycle-action command

- Scaling Types
  - Reactive Scaling
  - Scheduled Scaling
  - Predictive Scaling
- Scale Out Aggressively
- Scalle In Conservatively

- 4 Ways to Scale

  - Vertical Scaling
  - Scaling Storage
  - Read Replicas
  - Aurora Serverless

- Scaling Databases

  - RDS has the most database scaling options
  - Horizontal scaling is usully preferred over vertical
  - Read replicas are your friends
  - DynanoDB scaling comes down to access patterns

- Disaster Recovery Strategies

  - Recovery Point Objetive (RPO)
  - Recovery Time Objective (RTO)

  - Backup and Restore
  - Pilot Light
  - Warm Standby
  - Active/Active Failover

  - Simple Queue Services (SQS)
  - Simple Notofication Service (SNS)
  - API Gateway

  - SQS

    - Poll-based
    - Delivery Deley. Default 0
    - Message Size. 256 KB
    - Encryption.
    - Message retention. Default 4Days
    - Long vs Short
    - Queue Depth

  - Dead-Letter Queues
    - Cannot be porcessed successfully
    - Works with SQS and SNS

### - Decoupling workflows

USER &rarr; FRONT &rarr; BACK

- Simple Queue Service (SQS)
- Simple Notofication Service (SNS)
- API Gataway

- Always loosely couple
- Never Tighly couple
- Ineternal and External
- One Size

- Simple Queue Service (SQS)

  - Poll-based Messaging?

- SQS Setting

  - Delivery delay: Default 0; can be set up to 15 minutes.
  - Message Size: Messages can be up to 256 KB of text in any format.
  - Encrypt: Message are encrypted in trasit by default.
  - Message Retention: Default is 4 days; can be set between 1 minutes and 14 days.
  - Long vs Short: Long polling isn't the default, but it should be.
  - Queue Depth: This can be trigger for autoscaling.

- Sidelining Message with Dead-Letter Queues

  - Dead-Letter Queue (DLQ) are targets for messages that cannot be processed successfully.
  - Works with SQS and SNS!
  - Useful for debugging applications and messages system
  - Ability to isolate unconsumed messages to Troubleshoot
  - Redrive capability allows you to move the message back into the source Queue
  - These are technically just other SQS Queue
  - DLQs Used with FIFO SQS Queue must ALSO be FIFO Queues.

- Standard vs FIFO

| Standard                                 | FIFO                        |
| ---------------------------------------- | --------------------------- |
| Best-effort ordering                     | Guarenteed ordering         |
| Duplicate messages                       | No message duplication      |
| Nearly unlimited transactions per second | 300 transactions per second |

- Simple Notofication Service (SNS)

  - Is a Push-based messaging service.
  - It Proactively delivers messages to teh endpoints that are subscribed to it
  - This can be used to alert a system or a person
  - One message to many receivers

- SNS Setting

  - Subscribers: Kinesis data firehose, SQS Lambda, Email, HTTP(s), SMS, And platafrom apoplication endpoint.
  - Message Size: Messages can be up to 256KB to text in any format.
  - DLQ Support: Message that fail to be delivered can be stored in an SQS DLQ.
  - FIFO or Standard: FIFO Only supports SQS FIFO queues as a Subscriber
  - Encryption: Message are encryptedin trasitbe default. and ca add at-rest via AWS KMS
  - Access Policies: A resource policy cab be added to a topic. similar to S3. Useful for across-accoount access.

- API Gateway

  - Is a fully managed services that allows you to easily publish create, mantein, monitor, and secure your API.

- AWS Batch

  - Run batch computing workloads
  - Makes Thing Simpler
  - Automatically Provision and Scale
  - No Install Requiered!

  - Jobs
  - Job Definitions
  - Job Queues
  - Compute Environment

- Fargate vs EC2

| Fargate                                 | EC2                                       |
| --------------------------------------- | ----------------------------------------- |
| Recommneded Approach for most Workloads | Need more control over instance selection |
| Require fast start times (<30Seg)       | Require GPUs                              |
| Require 16vCPU or less                  | Require Elastic Fabric Adapter            |
| Require no GPUs                         | Require Cistim AMIs                       |
| Require 120 GiB of Memory or less       | High levels of concurrency                |
|                                         | Require access to Linux Parameters        |

### Amazon MQ Overview

- Message broker services allowing easier migrate of existing applications to the AWS Cloud
- Leverages multiples programming language, operating systems, and messaging protocols
- Currently support both Apache ActiveMQ or RabbitMQ engine Types
- Allows you to easily leverage existeng apps without managing and maintaing your own system

### Step Functions Overview

- Serverless orchestration services
- Graphical console
- Main componentes are state machines and task
- State Machine
- Task. Specific states within a worflow
- States Every single step within a worflow is consideraed a state

| Standard                                                                | Express                                                            |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------ |
| Have an exactly-one execution                                           | At-least-once workflow execution                                   |
| Can run for up to one year                                              | Can run for up five minutes                                        |
| Useful for long-runnig workflows that need to have an auditable history | Useful for high-event-rate workloads                               |
| Rates up to 2.000 executions per second                                 | Example use is IoT data streaming and ingesrion                    |
| Pricing based per state transition                                      | Pricing based on number of execution durations and memory consumed |

### - Different States

- Pass
- Task
- Choice
- Wait
- Succeed
- Fail
- Parallel
- Map

### AppFlow Overview

- Fully managed integration service for exchaging data between SaaS apps and AWS Services
- Pulls data records from third-party SaaS vendors and stores them in Amazon S3
- Bi-directional data transfers with limited combinations

### - Big data

### The 3 Vx of Big Data

- Volumen
- Variety
- Velocity

### Amazon Redshift

- Is a fully managed, petabyte-scale data warehouse services in the cloud
- it's very large relational database traditionally used in big data applications
- Recived its name due to desire to have people leave Oracle databases and levarege this AWS sevices instead

- Size. Can hold up 16 PB of Data
- Relational
- Based on PostgresSQL
- Usage
- High Performance
- Columnar

### Elactic MapReduce (EMR)

- ETL

  - Extract
  - Trasform
  - Load

- EMR?

An AWS Service to help with ETL Processing.

Hadoop Distributed Files System (HDFS)
EMR File System (EMRFS)
Local file System

### Purchasing Options and Cluster Types

- On-Demand
- Reserved
- Spot
- Long-Running or Temporary

### Kinesis

- Allows you ingest, process, and analyze real-time Streaming data. You can think of it as a huge data highway connected to your AWS accoount.

### 2 Versions

- Data Streams
- Data FireHose

### Athena?

Is an interactive query services that makes it easy to analyze data in S3 using SQL.
This Allows you to directly query data in your S3 Bucket without loading it into a database

### Glue?

Is a serverless data integration servioces that makes it easy to discover, prepare, and combine data.
It allows you to perform ETL workloads without managing underlying servers.

### Amazon QuckSight

Fully managed, serverless business intellignce (BI) data Visualizations service.
it allows you to easily create dashboards and shere them with specific users and groups.

### AWS Data Pipeline

Is a managed Extract, Trasform, Load (ETL) service for automating movement and transition of your data.

- Data Driven
- Parameters
- Highly Available
- Handling failures
- AWS Storage Services
- AWS Compute

#### Amazon MSK

- Fully Managed services for runnig data streaming Aplication that leverage Apache Kafka.
- Providers control plane operations. Creates, Updates, and deletes cluster as required.
- Data Plane, Leverage Kafka data-plane operationes for proceducing and cosuming streming data.
- Existing Application, Open Source Version of apache Kafka allow support for existing apps tools, and plugins.

### Important componentes

- Broker Nodes
- Zookeper Nodes
- Cluster Operations
- Producers, Consumers and Topics

#### Amazon OpenSearch Services

Is a managed services allowing you to run search and analiytics engines for varios use case.
Is is the successor to Amazon ElasticSearch Service.

- Quick Analysis
- Scalable
- Security
- Stability
- Flexible
- Integrations

### - Serverless

Physical Data Centers
Virtualization
The Cloud
Seververless

### Benefists of serverless

- Ease of use
- Event Based
- Billing Model

## AWS Lambda

Serverless compute service that lest you run code without porvisioning or managing the underlyng servers.

### Features

- Pricing
- Integrations
- Built-in Monitoring
- Easy Configuration
- Execition Length
- Runtime Support

### Configiration

- Runtine
- Permissions
- Networking
- Resources
- Trigger

### AWS Fargate (Serverless Containers)

AWS Fargate is a severless compute engine for docker containers
AWS Owns and manages the infrastructure
Requires use of ECS or EKS

## EventBridge

- Event
- Rules
- Event Bus

## Amazon ECR

- Regisrty
- Private
- Supported Formats

## EKS Anywhere

- Control Plane
- Location
- Update
- Curated Packages
- Entreprise subscripcion

## ECS Anywhere

- No orchestration needed
- Complety managed
- Inbound traffic
- External

### ECS o EKS

![EKSyECS](./images/EKSyECS.png)

**Terminología difiere entre ambos servicios:**

![DifferentesTerminosECSyEKS](./images/DifferentesTerminosECSyEKS.png)

### - Security

### DDoS Attack

- A Distributed denial of service

- Shield
- Shield Abanced
- Free DDoS
- WAF operate in layer 7
- PII - Personally identifiable information
- Amazon Inspector

### KMS

- AWS Key Management Services is a managed service that makes it easy for you create and control the encryption keys used to encrypt your data
- (CMK) Customer master key.
- (HSM) Hardware Securiruy Module.
- CloudHSM

### AWS Organizations

- Raiz de la Organizacion
- Unidad Organizativa
- Cuentas Miembros

### Control Tower

### Secrets Manager

### Parameter Store

### Amazon Resource Names (ARNs)

- arn:partition:service:region:account_id

### - AI amd ML

### - Media

### - Automation

### - Caching

### - Governance

### - Migration

- Retirar: Aplicaciones obsoletas que ya no se utilizan en la empresa pueden eliminarse.
- Retener: Aplicaciones que deben mantenerse localmente por regulaciones, rendimiento o residencia de datos.
- Refactorizar: Implica rediseñar la aplicación, desarrollar nuevo código y gestionar integralmente su ciclo de vida y la integración.
- Recomprar: Migrar a una solución disponible en la nube como software as a service, reemplazando una solución existente.
- Replataformar: Migración que conlleva modificaciones en la agrupación de servicios o infraestructura.
- Rehospedar: Movilizar sin modificaciones significativas la infraestructura actual hacia la nube, pudiendo realizarse de modo manual o automatizado.
- Reubicar: Estrategia especializada en trasladar entornos virtualizados con VMware hacia AWS mediante VMware Cloud, simplificando el proceso como un hypervisor level shift and shift.

AWS cuenta con una variedad de servicios clave que facilitan la migración e integración con ambientes locales:

DataSync: Facilita la migración automatizada y acelerada de grandes volúmenes de datos.
Transfer Family: Para transferencia segura y eficiente de archivos.
Storage Gateway: Almacenamiento híbrido que permite integración local y en la nube.
Migration Hub: Centraliza y monitorea el estatus de la migración de cada aplicación.
DMS (Database Migration Service): Especializado en migración de bases de datos.
Snow Family: Soluciones offline para transferencias de grandes volúmenes de datos de forma física y segura.

### - Well-Architected

- Operational Excellence
  - Perform Operations as code
    - Think of your workload as a piece of sottware
    - By turning operations into scripts & automating them
  - Make frequent, small, reversible changes
    - Make changes in small steps that can be undone
    - This helps you deal with issues quickly
  - Refine Operations Procedures frequently
    - All about "Constant Improvement"
    - As your workloads evolves, Proceduresshould also evolve
    - Be on the lookout for ways to refine & streamline operations
  - Anticipate failure
    - Identify possible failures before they accur
    - By regularly testing these scenarios
  - Learn from Operational failures
    - Every operational event / failure is a learning opportunity
    - Use these lessons to build stronger, more resilient systems
    - Sharing this knowledge can lead to significant improvements
- Security
  - Focuses on portecting data, system & assets
  - Confidentiality of data
  - Identity & Access management
  - Controls to detect security threats
- Reliability
  - Automatically Recover from failure
    - Monitor important metrics closely
    - Use automation to fix issues as soon as they aoccur
    - Your system bounces back when something goes wrong
  - Test Recovery Procedures
    - Actively test how our systems handle failures
    - Use automation to simulate different failure scenarios
  - Horizontlly Scale to increase Aggregate workload Availability
    - The goal is to spread workload across multiple small resources
    - If one part fails, it won't shut down everything
  - Stop Guessing capacity
    - Manitor how much our systems ate being used
    - Adjust our resources accordingly
    - The goal is to have the exact resources we need
  - Manage change Throgh automation
    - Automate changes to our infrastructure
    - This method ensures consistent, easily trackable and smooth running results
- Performance Efficiency
  - Using computing resources efficiently
  - Maintaining the efficiency as changes occur
- Cost Optimization
  - Avoiding unnecessary cost
  - Using the right type of resources
  - Meking cost-effective decisions

---

- Implement cloud financial mangement
- Adopt consumption model
- Measure overall efficiency
- Stop spending money on undifferentiated lifting
- Analyze and attribute expenditure

---

### Revision for success

- Focus on areas you feel the least comfortable
- Practice Exam
- Take a Break

- Search for the answer yourself
- Try to build it in an actual AWS Account
- Checks the AWS FAQs
- Post in our forums
- Search again!

### 5 Tips AWS Exam

- Spot the distractors.
- Watch for like "More", "least", etc.
- The word soup is never right if it makes you laugh, it's wrong.
- Word association is your friend.
- Read Every answer least once.

---

### Workshops

[From VMs to cloud-native - An AWS modernization journey](https://catalog.us-east-1.prod.workshops.aws/workshops/051f698a-5440-4123-93f6-0c32375a63c9/en-US)

[AWS Database Migration Workshop](https://catalog.workshops.aws/databasemigration/en-US)

[Migrating SQL Server database to Amazon RDS for SQL Server using Database Migration Service (DMS)](https://catalog.workshops.aws/dmwrdssql/en-US)

[SAP ASE (Sybase) to Amazon RDS for SQL Server Migration Workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/d806c678-7a11-4aa0-8a42-c15f0d9fbb33/en-US)

### Exam Guide

- [New Here?](https://www.youtube.com/playlist?list=PL9nWRykSBSFigYYU-PV7u0fn5tn_ee-iu)

- [AWS SAA-C03 PRACTICE EXAM QUESTIONS - Master the AWS Solutions Architect Associate Exam in 2024!](https://www.youtube.com/watch?v=FhRQq7obZ64)

- ✅ [Everything you need to know about the SAA-C03 Exam for the AWS Solutions Architect Associate](https://www.youtube.com/watch?v=6OldWhKIBVE)

| Day | Road Map                                                    | Sources  | Start     | End       | Status  |
| --- | ----------------------------------------------------------- | -------- | --------- | --------- | ------- |
| 1   | Curso de AWS Certified Solutions Architect Associate        | Platzi   | 20/AGU/25 | 26/AGU/25 | Done ✅ |
| 2   | Learn Cantrill                                              | Cantrill | 09/SEP/25 |           |         |
| 3   | Ultimate AWS Certified Solutions Architect Associate 2025   | Udemy    |           |           |         |
| 4   | AWS Certified Solutions Architect Associate 2025 – SAA-C03  | Udemy    |           |           |         |
| 5   | AWS Certified Solutions Architect Associate - Hands-On+Exam |          |           |           |         |
| 6   | SAA-C03: AWS Certified Solutions Architect - Associate      | Exam     | 30/SEP/25 |           |         |

🟡 Pluralsight
