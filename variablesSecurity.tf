## Security variables
variable "sourceIPs" {
  type        = list(any)
  default     = ["173.66.39.236"]
  description = "Public IPs to allow inboud communications."
}
