data "aws_vpc" "default" {
  default = true
}

data "aws_route_tables" "rts" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_iam_policy_document" "neptune_account_assume_role_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [var.trusted_role_arn]
    }

    actions = ["sts:AssumeRole"]
  }
}
