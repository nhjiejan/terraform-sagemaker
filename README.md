# AWS SageMaker module
This module creates an AWS SageMaker instance. See linke [here](https://aws.amazon.com/sagemaker/) for more details.

## Dynamic config variables:
```
name                    = Name of SageMaker project
capabilities            = List of IAMs capabilities
SubnetId                = Subnet ID
SecurityGroupIds        = Security Group IDs
InstanceType            = notebook instance Size. e.g "ml.t2.medium"
DirectInternetAccess    = Allow Internet Access on notebook
NotebookInstanceName    = Notebook instance name

```


## Outputs:
```


```

## Prerequsitis
* aws network
* storage account


## Example Config

main.tf
```
# sagemaker notebook instance

module "aws_sagemaker_notebook" {
  source                    = "<<This Repo>>"
  project_name              = "${var.project_name}"
  sagemakerConfigs          = "${local.sagemakerConfigs}"
  sagemakerInstanceCount    = "1"
}
```

locals.tf
```
locals {
  base_tags {
    client      = "${var.project_name}"
    environment = "${terraform.workspace}"
  }

sagemakerConfigs = [
    {
      project_name            = "${var.project_name}"
      capabilities            = ["CAPABILITY_IAM"]
      SubnetId                = "${module.aws_network.private_subnet_ids[0]}"
      SecurityGroupIds        = "${module.aws_sagemaker_sg.id}"
      InstanceType            = "ml.t2.medium"
      DirectInternetAccess    = "Enabled"
      NotebookInstanceName    = "${var.project_name}-${terraform.workspace}-notebook"
    },
]

}
```

### TODO
* 
