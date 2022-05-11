#  ssh-keygen -t rsa -b 4096 -C "example@example.com" -f ./example-key -N ""

resource "aws_key_pair" "example-key-pair" {
  key_name   = "example-key-pair"
#  public_key = file("./example-key.pub")
  public_key = file("${path.module}/example-key.pub")

  tags = merge(
      var.default_tags,
      {Service = "key-pair"},
      {Name = "exmaple-key-pair"}
  )
}
