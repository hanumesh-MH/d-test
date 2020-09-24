 
resource "aws_key_pair" "auth" {
  key_name   = "${ var.key_name }"
  public_key = "${ file(var.public_key_path) }"
}


resource "aws_instance" "3-tier-guilherme" {
  ami = "${ data.aws_ami.coreos.id }"

  instance_type = "${ var.instance_type }"
  key_name      = "${ var.key_name }"

  source_dest_check           = false
  subnet_id                   = "${ aws_subnet.public_subnet.id }" 
  associate_public_ip_address = true                               

  tags {
    BuiltWith = "terraform"
    Name      = "3-tier-guilherme"
  }

  vpc_security_group_ids = ["${ aws_security_group.3-tier-guilherme-security-group.id }"] 

  user_data = "${ data.template_file.user_data.rendered }" 
}

# resource that renders the userdata template
data "template_file" "user_data" {
  template = "${ file("user-data.tpl") }" 
}
