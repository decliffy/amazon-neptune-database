output "neptune_cluster_id" {
  description = "Cluster Id of the Neptune database cluster"
  value       = resource.aws_neptune_cluster.default.id
}

output "neptune_cluster_resource_id" {
  description = "Cluster Id of the Neptune database cluster"
  value       = resource.aws_neptune_cluster.default.cluster_resource_id
}

output "neptune_reader_endpoint" {
  description = "A read-only endpoint for the Neptune cluster, automatically load-balanced across replicas"
  value       = resource.aws_neptune_cluster.default.reader_endpoint
}

output "neptune_endpoint_dns" {
  description = "The DNS address of the Neptune instance"
  value       = resource.aws_neptune_cluster.default.endpoint
}

output "neptune_s3_bucket_name" {
  description = "Neptune DB bulk loader bucket"
  value       = module.s3_bucket.s3_bucket_id
}

output "neptune_role_iam_arn" {
  description = "Neptune buld loader bucker IAM role ARN"
  value       = aws_iam_role.neptune_account_assume_role.arn
}