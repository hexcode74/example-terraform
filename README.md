# Example Infrastructure as Code with Terraform using AWS

## 설명

AWS 의 VPC/Subnet/IGW/RDS/EC2 Terraform 쉬운 예제

### Install

```bash
$ brew install terraform
```

### AWS credentials 

```bash
$ vi ~/.aws/config
[profile example-profile]
sso_start_url = https://sso.example.com/login
sso_region = ap-northeast-2
sso_account_id = 00000000000
sso_role_name = devops
region = ap-northeast-2
output = json
```

### usage

```bash
$ aws sso login --profile example-profile
$ cd {각각 project dir}
$ terraform init
$ terraform plan
$ terraform refresh
$ terraform apply
```

## 디렉토리 구조

* terraform plan 실행시간을 단축하기 위해서 프로젝트를 디렉토리 단위로 구분한다.
* 프로젝트를 최소한의 단위(디렉토리)로 리소스를 분리해서 적용한다.
    * ex) example-project 이하에는 RDS, S3, EC2, EKS 리소스를 디렉토리로 분리해서 사용
* 공통 tf 파일 설명
  * providers.tf : 프로바이더 및 프로파일 정의
  * backend.tf : tfstate 백엔드 정의
  * data.tf : data sources 정의
  * variables.tf : 변수 type 정의
  * default.auto.tfvars : variables.tf 에 정의된 변수 값
  * outputs.tf : 실행결과 출력 정의


```
example-terraform(root)
├── common
│   └── backend : S3 를 이용한 backend 
│       ├── aws.tf
│       ├── main.tf
│       ├── terraform.tfstate
│       └── terraform.tfstate.backup
├── infra
│   └── vpc : VPC/Subnet/RT/NACL 생성
│       ├── backend.tf
│       ├── default.auto.tfvars
│       ├── internet_gateway.tf
│       ├── network_acl.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── route_table.tf
│       ├── subnet.tf
│       ├── variables.tf
│       └── vpc.tf
└── service
    └── example-service : 각 프로젝트별 서비스
        ├── ec2
        │   ├── backend.tf
        │   ├── data.tf
        │   ├── default.auto.tfvars
        │   ├── example-key
        │   ├── example-key.pub
        │   ├── instance.tf
        │   ├── key-pair.tf
        │   ├── providers.tf
        │   ├── security-group.tf
        │   ├── user-data.sh
        │   └── variables.tf
        ├── eks
    ...


```

