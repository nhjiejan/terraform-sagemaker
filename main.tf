resource "aws_cloudformation_stack" "sagemaker_notebook" {
  count                   = "${var.sagemakerInstanceCount}"
  name                    = "${lookup(var.sagemakerConfigs[count.index], "project_name")}-${terraform.workspace}-sagemaker-notebook"
  capabilities            = ["CAPABILITY_IAM"]
  parameters {
    SubnetId              = "${lookup(var.sagemakerConfigs[count.index], "SubnetId")}"
    SecurityGroupIds      = "${lookup(var.sagemakerConfigs[count.index], "SecurityGroupIds")}"
    InstanceType          = "${lookup(var.sagemakerConfigs[count.index], "InstanceType")}"
    DirectInternetAccess  = "${lookup(var.sagemakerConfigs[count.index], "DirectInternetAccess")}"
    NotebookInstanceName  = "${lookup(var.sagemakerConfigs[count.index], "NotebookInstanceName")}"
  }
  template_body = "${file("${path.module}/sagemaker_cloudformation.json")}"

}