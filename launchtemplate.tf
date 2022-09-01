resource "aws_launch_template" "msvpc-lt-01" {
  name     = "msvpc-lt-01"
  key_name = var.KEY_PAIR

  # #Enabling monitoring turns on detailed monitoring, which has a cost attached
  #   monitoring {
  #     enabled = true
  #   }

  vpc_security_group_ids = ["${aws_security_group.msvpc-sg-ec2.id}"]
  instance_type          = "t2.micro"
  image_id               = data.aws_ami.ms-server-ami.id

  user_data = filebase64("userdata.sh")
}

