variable "region" {
  type        = string
  description = "The AWS Region"
  default     = "us-west-2"
}

variable "ami" {
  type        = string
  description = "The AMI"
  default     = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

variable "web_sg_name" {
  type        = string
  description = "The web security group name"
  default     = "allow_web_traffic_sg"
}

variable "web_port_80" {
  type        = number
  description = "The HTTP port"
  default     = 80
}

variable "web_port_443" {
  type        = number
  description = "The HTTPS port"
  default     = 443
}

variable "ssh_port_22" {
  type	      = number
  description = "The SSH port"
  default     = 22
}

variable "protocol" {
  type        = string
  description = "The layer 4 protocol"
  default     = "tcp"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "server_url" {
  type    = string
  default = "jasonteske.com"
}

variable "key_pair_name" {
  type        = string
  default     = "mykeypair"
}

variable "public_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCOSykDbH6r4g89TxyRgO90WVDjSkTY6BdNrmfQhnPVczcevpvPpb3/tWKHkh5blMAy/emhcKrPu56LNzDt28frJvZhepghnB6ewLuMEFvXZKhBgcImj+7HsJB+w7d6JOa4L0z+OeZ1hpuGW9/ahUqHX/lEvnQNcf3IrjHi1f37Pcn1qJe2g0svhPj64/AAWbKWG7a/gHwDDRyrcZDiFmO654+ljxoPE2sUnysElpopAffDOVmTQ9v9EyFepqVHOYMENpQk+Fkw32jLnu2xP5ZhwO0Pmn88KpkC6oY+xSS0mNVVjQWZjBvmfs5VLCPBIq6Mw4HM3u3BY6yzzU3+0vQTAdPq80G12UYR9R1wwBIUnVVlOiZNhX00OrTcRplDMhT58G46qINcEbeezMlnw0PPOlbsn0s4RP8pkqoEXW5SVRaMJurJuz4F7Y0DV29xvWb0kXshtKOM/BMs77hpvdyKYAH47MIGYFsFX5X7oo/yq8A0VAKN3fb4gxzz7K1KLguwP+PcT3eiKOdwcVAsXFVbhARnDjJJEN4dPdQ5j+Yal4dN9bnpvtVANA05hNhWiSwmydpWN2/uM5LOZWkGvsJr/hUwma7lRU0NdifwqJYHWvqocwN2JH2Zxt0vjEMSqr8/u1U890n8/9DQ7QdEkpXs38FSW/7sMDT0ueQd9s6gQ== jteske@JTeskes-MBP"
} 
