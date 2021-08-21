resource "aws_security_group" "minecraft" {
  name        = "minecraft"
  description = "for minecraft server"
  vpc_id      = aws_vpc.minecraft.id

  ingress {
    description = "SSH from My House"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["39.111.235.214/32"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["118.83.110.228/32"]
  }

  ingress {
    description      = "Minecraft from ALL"
    from_port        = 25565
    to_port          = 25565
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "minecraft"
  }
}
