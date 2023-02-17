resource "aws_key_pair" "mykeypair" {
  key_name = var.key_pair_name
  public_key	= var.public_key
}

resource "aws_instance" "app_server" {
  ami                         = var.ami_in
  instance_type               = var.instance_type_in
  tags                        = var.tags_in
  security_groups             = [var.sg_id_in]
  associate_public_ip_address = true
  key_name	= aws_key_pair.mykeypair.key_name
  user_data                   = file("bootstrap.sh")
#  provisioner "file" {
#    source      = file("${path.module}/files/vhost_template.conf")
#    destination = "/etc/httpd/conf.d/www.jasonteske.com.conf"
#    connection {
#      type     = "ssh"
#      user     = "ec2-user"
#      private_key = file("${path.module}/files/id_rsa")
#      host     = "${self.public_ip}" 
#    }
#  }
}

resource "tls_self_signed_cert" "jasonteske" {
  private_key_pem = file("${path.module}/files/jasonteske.com.key")

  subject {
    common_name  = "jasonteske.com"
    organization = "jteske INC"
  }

  validity_period_hours = 168

  dns_names = ["*.${var.server_url}"]

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
