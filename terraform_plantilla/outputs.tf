output "VPC ID" {
  value = "${aws_vpc.terraform-vpc.id}"
}

output "JENKINS EIP" {
  value = "${aws_eip.jenkins.public_ip}"
}

output "ELB URI" {
  value = "${aws_elb.movie-app-elb.dns_name}"
}

output "Private subnet ID" {
  value = "${aws_subnet.private-1.id}"
}

output "movie-app secgroup" {
  value = "${aws_security_group.movie-app.id}" 
}

output "ELB URI PROD" {
value = "${aws_elb.movie-app-elb-prod.dns_name}"
}
