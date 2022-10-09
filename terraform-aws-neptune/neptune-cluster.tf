resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = "neptune-cluster"
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  iam_roles                           = [aws_iam_role.neptune_account_assume_role.arn]
  apply_immediately                   = true
  vpc_security_group_ids              = [aws_security_group.neptune_connect_sg.id]

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}

resource "aws_neptune_cluster_instance" "neptune_cluster" {
  count              = 2
  cluster_identifier = aws_neptune_cluster.default.id
  engine             = "neptune"
  instance_class     = "db.t3.medium"
  apply_immediately  = true

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}

resource "aws_security_group" "neptune_connect_sg" {
  name = "neptune-connectivity"

  #Incoming traffic
  ingress {
    from_port   = 8182
    to_port     = 8182
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.default.cidr_block]
  }

  #Outgoing traffic
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}

