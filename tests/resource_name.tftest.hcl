mock_provider "aws" {}

# TEST 1: Assert aws_cloudfront_function name equals 'StaticSiteReWriteDefaultIndexRequest' (plan-only)
# Why: prevents accidental renames that would break downstream consumers.

run "cloudfront_function_name_is_correct" {
  command = plan

  assert {
    # Single behaviour: exact name match + non-empty guard.
    condition = aws_cloudfront_function.rewritedefaultindexrequest.name == "StaticSiteReWriteDefaultIndexRequest" && aws_cloudfront_function.rewritedefaultindexrequest.name != ""
    error_message = "Expected CloudFront Function name to be 'StaticSiteReWriteDefaultIndexRequest' and not empty."
  }
}
