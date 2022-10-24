########################
# Config Backend
########################

terraform {
  backend "s3" {
    bucket         = "tf-remote-state20221020192054854800000002"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "b55f8918-b04d-4296-9d87-f501cefa9837"
  }
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "cake-security-group" {
  vpc_id      = "${data.aws_vpc.default.id}"
  name        = "cake"
  description = "Allow all inbound for Postgres"
ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_db_instance" "cake" {
  identifier           = "cake-staging"
  allocated_storage    = 10
  db_name              = "cake"
  engine               = "postgres"
  engine_version       = "12"
  instance_class       = "db.t3.micro"
  username             = "cake"
  password             = "lkndf892ur3ojwur"
  multi_az             = true
  storage_encrypted    = true
  deletion_protection  = true
#  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
#  disable auto minor version
  auto_minor_version_upgrade  = false
#  environment = "Staging"   

}
