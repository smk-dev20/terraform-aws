resource "aws_s3_bucket" "b" {
    bucket = "mytfbucket-c789fsif"

    tags = {
        Name = "mytfbucket-c789fsif"
    }
}