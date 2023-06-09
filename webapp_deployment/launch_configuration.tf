resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.application_name}-node-"
  image_id      = var.worker_ami
  instance_type = "t2.micro"
  iam_instance_profile = var.instance_profile
  user_data = <<EOF
#! /bin/bash
aws s3 cp s3://${var.artifact_bucket}/lecture-springboot-simple/${var.application_version} ./ --recursive --region eu-central-1
sudo java -jar *.jar
EOF

  security_groups = [aws_security_group.application_server_security_group.id]

  key_name = "iouri_key"

  lifecycle {
    create_before_destroy = true
  }
}
