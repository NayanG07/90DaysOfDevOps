# Day 08 — Cloud Server Deployment

## Instance Details
- Provider: AWS EC2 (Free Tier)
- AMI: Ubuntu 24.04 LTS
- Instance Type: t2.micro
- Security Group: SSH (22), HTTP (80), HTTPS (443)

## Commands Used
```bash
# SSH into instance
ssh -i devops-key.pem ubuntu@<instance-ip>

# Update system
sudo apt update && sudo apt upgrade -y

# Install Nginx
sudo apt install nginx -y

# Verify Nginx is running
systemctl status nginx

# View Nginx logs
sudo tail -n 100 /var/log/nginx/access.log

# Save logs to file
sudo tail -n 200 /var/log/nginx/access.log > ~/nginx-logs.txt
sudo tail -n 100 /var/log/nginx/error.log >> ~/nginx-logs.txt

# Download to local machine
scp -i devops-key.pem ubuntu@<instance-ip>:~/nginx-logs.txt .
```

## Challenges Faced
- Security group misconfigured initially — forgot to open port 80.
- Fixed by adding HTTP (80) inbound rule in AWS console.

## What I Learned
- How to launch and SSH into an EC2 instance
- Security groups act as a virtual firewall
- Nginx logs are split into access.log and error.log
- `journalctl` and `tail` serve different use cases for log inspection
