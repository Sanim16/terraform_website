#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo " " > /var/www/html/index.html #This overwrites the default index.html file
cat <<EOT >> /var/www/html/index.html
<!DOCTYPE html>
<html>
<title>Sample site deployed with Terraform</title>
<body>

<h1>Hello World from Momoh at $(hostname -f)</h1>
<p>

This site was deployed with Terraform to an EC2 instance in an Auto Scaling Group fronted by an Application Load balancer.
It's a basic page deployed by the userdata script, You could put an instruction to get the site from S3 for a full site.
You could also use the file provisioner to copy the files(or directories) from your local system.
Cheers and have a good day

</p>

</body>
</html>
EOT