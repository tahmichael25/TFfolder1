#!/bin/bash
# Update package lists
sudo yum update -y
# Install Apache
sudo yum install httpd -y
# Create an HTML file
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
<title>Congratulations EL ROI!</title>
<style>
body {
    background-color: #007bff; /* Blue background */
}
h1 {
    color: pink;
    font-family: Arial;
    font-size: 22px;
    text-align: center;
}
</style>
</head>
<body>
<h1>Well done EL ROI on being a Sr. Cloud Engineer</h1>
</body>
</html>
EOF
# Start Apache
sudo systemctl start httpd
sudo systemctl enable httpd