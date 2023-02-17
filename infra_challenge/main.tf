module "ec2" {
  source           = "./ec2"
  ami_in           = var.ami
  instance_type_in = var.instance_type
  sg_id_in         = module.security_group.sg_name
  server_url       = var.server_url
  key_pair_name      = var.key_pair_name
  public_key    = var.public_key
  tags_in = {
    Name = "webserver.jasonteske.com"
  }
}

module "security_group" {
  source         = "./security_group"
  web_sg_name_in = var.web_sg_name
  cidr_blocks_in = var.cidr_blocks
  port_in_80        = var.web_port_80
  port_in_443       = var.web_port_443
  port_in_22	    = var.ssh_port_22
  protocol_in    = var.protocol
  tags_in = {
    Name = "web_security_group"
  }
}
