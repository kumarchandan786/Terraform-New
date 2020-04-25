provider "aws" {
  region = var.Region
}
resource "aws_instance" "Node" {
   ami = "ami-085925f297f89fce1"
   instance_type = "t2.micro"
   vpc_security_group_ids = ["${aws_security_group.network.id}"]
   user_data = <<-EOF
       #!/bin/bash
       echo "Hello World" >index.html
       nohup busybox httpd -f -p 8080 &
       EOF

   tags = {
       Name = "UBUNTU1"
   }
}


resource "aws_security_group" "network" {
  ingress {
    description = "TLS from VPC"
    from_port   = var.Server_por
    to_port     = var.Server_por
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
