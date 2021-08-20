#インスタンスのEIPを出力
output "instance_ip" {
  value = aws_eip.instance.public_ip
}

# インスタンスIDを出力
resource "local_file" "instance-id" {
  filename = "./instance_id"
  content  = aws_instance.instance.id
}
