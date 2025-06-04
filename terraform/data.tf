data "aws_iam_policy_document" "example" {
  provider = aws.moe-root2
  statement {
    sid = "AllowS3ReadAccess"

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::example-bucket",
      "arn:aws:s3:::example-bucket/*",
    ]
  }

  statement {
    sid = "AllowEC2Describe"

    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeVolumes",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "another_policy" {
  provider = aws.moe-root2
  statement {
    sid = "AllowDynamoDBReadAccess"

    actions = [
      "dynamodb:Scan",
      "dynamodb:Query",
    ]

    resources = [
      "arn:aws:dynamodb:us-east-1:123456789012:table/example-table",
    ]
  }

  statement {
    sid = "AllowCloudWatchLogs"

    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}