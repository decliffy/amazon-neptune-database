
resource "aws_instance" "neptune_ec2_instance" {
  ami             = data.aws_ami.amazon_linux.id
  key_name        = aws_key_pair.deployer.key_name
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.ec2_connect_sg.name]
  user_data       = file("install_gremlin_console.sh")

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "ec2-neptune-keypair-ssh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDB1AYS1OdGeyn15zEihNfztOokDMUTA1nBc+aTyIHRMdcq71VZr5xlCOmO1sORH4c4SSwBkxOtoG7AF0JwQNtB891JqVHB7zZV7HE2ZjhojeoKugLgVlJJMxdTMa2ZKanEPKTTYcXvGncMaUxwXi4cWR9v+Rbsg0YtsORHbjCluKxn7xvnqSaIbFAvAwVPxh0TBgR1GVbFQ0SLIvnB32rm7jJkeFvMqqEX1RYXd4mLvO1c3JxNFsKRzSq1p9ztdNbJgEzrYJDWtYRRBFAo/4mJPKQ/aaVUq7zrVRKSEuBqWqkVf+axhc2qvilPJJBGJ3g+aBpPb4F1Ak94jZ3VAcOOzWM0M+ZRZVwKPiepoP3ANRtQXt9IG9q4s9Y1eJmwKhsEW4lUdVZeKAowoBWVcTLEWcQ418cX7DQfmWQGgn77CIdPwnpFDjJL9h8Au5qNk7bj4gnR8C7+nLdeAVJuV3g5RCKW/wa5jIPMhLeIWdxQlrymc/TgNIJbcG+aokXWmCM= clifforddsouza@Cliffords-iMac.local"
}

resource "aws_security_group" "ec2_connect_sg" {
  name = "ec2-connectivity"

  #Incoming traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["110.226.182.234/32"]
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