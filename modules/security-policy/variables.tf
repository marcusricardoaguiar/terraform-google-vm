# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project_id" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "ip_white_list" {
  type = list(string)
  description = "IP Whitelist"
}