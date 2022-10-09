module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "neptune-bulkloader-bucket"
  acl    = "private"

  versioning = {
    enabled = false
  }

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}

# S3 VPC Endpoint - Gateway type
resource "aws_vpc_endpoint" "s3" {
  vpc_id          = data.aws_vpc.default.id
  service_name    = "com.amazonaws.us-west-2.s3"
  route_table_ids = [data.aws_route_tables.rts.ids[0]]

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}