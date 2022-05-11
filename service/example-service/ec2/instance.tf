resource "aws_instance" "example-ec2" {
  ami           = "ami-0cbec04a61be382d9"
  instance_type = "t2.micro"
  user_data_base64 = data.template_cloudinit_config.example-aws-data-files.rendered
  subnet_id = data.terraform_remote_state.example-vpc.outputs.example-subnet-public1-2a_id
  key_name = aws_key_pair.example-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.example-ec2.id]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 50
    delete_on_termination = true
  }

  tags = merge(
  var.default_tags,
  {Service = "ec2"},
  {Name = "example-ec2"}
  )
}
