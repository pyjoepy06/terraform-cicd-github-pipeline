# GitHub CI/CD Example
# All values are written directly in this file on purpose.
# No variables, locals, count, for_each, or modules.

# ONE VPC
resource "aws_vpc" "ci-cd-vpc" {
  cidr_block           = "10.50.0.0/23"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ci-cd-vpc"
  }
}

# THREE SUBNETS
resource "aws_subnet" "web_subnet" {
  vpc_id                  = aws_vpc.ci-cd-vpc.id
  cidr_block              = "10.50.0.0/25"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ci-cd-web-public"
  }
}

resource "aws_subnet" "app_subnet" {
  vpc_id                  = aws_vpc.ci-cd-vpc.id
  cidr_block              = "10.50.0.128/25"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ci-cd-app-lab-public"
  }
}

resource "aws_subnet" "db_subnet" {
  vpc_id                  = aws_vpc.ci-cd-vpc.id
  cidr_block              = "10.50.1.0/25"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ci-cd-db-lab-public"
  }
}

# ONE INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.ci-cd-vpc.id

  tags = {
    Name = "ci-cd-internet-gateway"
  }
}

# THREE ROUTE TABLES
resource "aws_route_table" "web_route_table" {
  vpc_id = aws_vpc.ci-cd-vpc.id

  tags = {
    Name = "ci-cd-web-route-table"
  }
}

resource "aws_route_table" "app_route_table" {
  vpc_id = aws_vpc.ci-cd-vpc.id

  tags = {
    Name = "ci-cd-app-route-table"
  }
}

resource "aws_route_table" "db_route_table" {
  vpc_id = aws_vpc.ci-cd-vpc.id

  tags = {
    Name = "ci-cd-db-route-table"
  }
}

# All three subnets have internet routes for this low-cost classroom bootstrap.
resource "aws_route" "web_internet_route" {
  route_table_id         = aws_route_table.web_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# Classroom-only internet routes for apt package installation.
resource "aws_route" "app_internet_route" {
  route_table_id         = aws_route_table.app_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}
resource "aws_route" "db_internet_route" {
  route_table_id         = aws_route_table.db_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# THREE EXPLICIT ROUTE TABLE ASSOCIATIONS
resource "aws_route_table_association" "web_association" {
  subnet_id      = aws_subnet.web_subnet.id
  route_table_id = aws_route_table.web_route_table.id
}

resource "aws_route_table_association" "app_association" {
  subnet_id      = aws_subnet.app_subnet.id
  route_table_id = aws_route_table.app_route_table.id
}

resource "aws_route_table_association" "db_association" {
  subnet_id      = aws_subnet.db_subnet.id
  route_table_id = aws_route_table.db_route_table.id
}
