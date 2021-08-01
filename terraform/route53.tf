resource "aws_route53_record" "minecraft" {
  zone_id = "Z085588124HQT3WLPK0Q1"
  name    = "minecraft"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.instance.public_ip]
}
