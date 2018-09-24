variable "project_name" {
  description = "name of project"
}
variable "sagemakerConfigs" {
  type = "list"
}

variable "sagemakerInstanceCount" {
    default = 1
}

