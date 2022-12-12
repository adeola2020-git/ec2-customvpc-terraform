output "web_instance_ip" {
  description = "Web instance complete URL"

  # value = aws_instance.Terra_instance.public_ip
  value = join("", ["http://", aws_instance.Terra_instance.public_ip])

}

