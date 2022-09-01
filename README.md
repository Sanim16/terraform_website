# terraform_website
Use Terraform to deploy a webserver in an auto scaling group fronted by an application load balancer on AWS.

This site was deployed with Terraform to 2 EC2 instances in an Auto Scaling Group fronted by an Application Load balancer.

The load balancer is accessible via port 80 and 443 from the Internet while the instances allow all trafic from only the load balancer.(You can edit the ports for this in the securitygroup.tf file)

The instances are also accessible by ssh from the IP address specified in the variable MY_IP

At start-up the user-data runs to install Apache and write a simple home page, alternatively the script could be configured to download a website folder from S3.

It is deployed in Us-east-1 region and some of the availability zones are hardcoded, however i will try to update this.

The AMI specified in others.tf is also hard coded, this will also be updated.

Cheers and have a good day, I hope some one finds this useful.
