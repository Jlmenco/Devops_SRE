
resource "aws_db_subnet_group" "sre_db" {
  name       = "sre_db"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "sre_db"
  }
}
resource "aws_security_group" "rds" {
  name   = "sre_rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sre_rds"
  }
}

resource "aws_db_parameter_group" "sre" {
  name   = "sre"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "sre" {
  identifier             = "sre"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "13.1"
  username               = "sre"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.sre_db.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.sre.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}
