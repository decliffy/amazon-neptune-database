resource "aws_iam_role" "neptune_account_assume_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.neptune_account_assume_role_policy.json

  tags = {
    Name        = "neptuneclientinstance"
    Environment = "test"
  }
}

resource "aws_iam_role_policy_attachment" "neptune_account_assume_role" {
  count = length(var.policy_arns)

  role       = aws_iam_role.neptune_account_assume_role.name
  policy_arn = element(var.policy_arns, count.index)
}