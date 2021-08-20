#AmazonLinux2の最新AMIを取得
data "aws_ami" "recent_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*"]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "instance" {
  ami                     = data.aws_ami.recent_amazon_linux_2.image_id # latest-AmazonLinux2
  instance_type           = "t3a.small"
  vpc_security_group_ids  = [aws_security_group.minecraft.id]
  subnet_id               = aws_subnet.public_1a.id
  key_name                = "minecraft"
  iam_instance_profile    = "EC2_SSM"
  availability_zone       = "ap-northeast-1a"
  disable_api_termination = false

  root_block_device {
    volume_type = "standard"
    volume_size = "15"
  }

  tags = {
    Name = "mincecraft-server"
  }

}

# EIP
resource "aws_eip" "instance" {
  instance = aws_instance.instance.id
  vpc      = true
}
