variable AWS_REGION {
    default = "us-east-1"
}

variable AWS_ACCESS_KEY {

}

variable AWS_SECRET_KEY {
    
}

variable PATH_TO_PRIVATE_KEY {

}

variable PATH_TO_PUBLIC_KEY {

}

variable AMIS {
    type = map(string)
    default = {
        us-east-1 = "ami-053b0d53c279acc90"
    }
}