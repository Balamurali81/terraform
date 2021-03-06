resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_Multi_lambda_${var.region}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "lambda2.zip"
  function_name = "lambda_multi_region"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda2.bala"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("lambda2.zip")

  runtime = "python3.7"

  environment {
    variables = {
      tag = "multiregion"
    }
  }
}