resource "aws_instance" "tf-example" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    subnet_id = aws_subnet.tf-main-public-subnet-1.id

    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    key_name = aws_key_pair.mykeypair.key_name

    iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-east-1a"
    size = 20
    type = "gp2"
    tags = {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id = aws_ebs_volume.ebs-volume-1.id
    instance_id = aws_instance.tf-example.id
    stop_instance_before_detaching = true
}
