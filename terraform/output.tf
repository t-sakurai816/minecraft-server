#インスタンスのEIPを出力
output "instance_ip" {
  value = aws_eip.instance.public_ip
}

# インスタンスIDを出力
output "instance_id" {
  # filename = "./instance_id"
  value = aws_instance.instance.id
}
