resource "aws_launch_configuration" "tf-example-launchconfig" {
    name_prefix = "tf-example-launchconfig"
    image_id = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykeypair.key_name
    security_groups = [aws_security_group.allow-ssh.id]
}

resource "aws_autoscaling_group" "tf-example-autoscaling" {
    name = "tf-example-autoscaling"
    vpc_zone_identifier = [aws_subnet.tf-main-public-subnet-1.id, aws_subnet.tf-main-public-subnet-2.id]
    launch_configuration = aws_launch_configuration.tf-example-launchconfig.name
    min_size = 1
    max_size = 2
    health_check_grace_period = 300
    health_check_type = "EC2"
    force_delete = true

    tag {
        key = "Name"
        value = "autoscaled-ec2-instance"
        propagate_at_launch = true
    }
}