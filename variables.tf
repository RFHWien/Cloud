# R2: Region configurable for isolated deployment

variable "region" {
  description = "AWS region for deployment (EU / US)"
  type        = string
  default     = "eu-central-1"
}

variable "company_ip" {
  description = "Company public IP"
  type        = string
  default     = "1.2.3.4/32"
}
