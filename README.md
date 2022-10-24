# Cake
Terraform Cake Environment

# terraform-aws-rds-postgres-cake

[![Terraform Version](https://img.shields.io/badge/Terraform%20Version->=0.13.0,_<0.14.0-blue.svg)](https://releases.hashicorp.com/terraform/)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)

## Description

Terraform module which creates an AWS RDS Postgres.


## Prerequisites

Requirements
------------

- An existing VPC "Default"
- An existing Minor Update = false
- An existing Postgres parameter group
- An existing multi_az Enable

Password for Master DB
----------------------

- The module will generate a random 16 characters long password.
- The module will output this password.
- Make sure that you change the password after the provisioning is successfully completed.

Environment
------------

I was created my envinronment with two buckets.

- `1 - Store terraform state and version the code.`
- `2 - Use by some application for Cake Company.`
