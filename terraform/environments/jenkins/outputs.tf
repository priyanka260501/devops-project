output "jenkins_public_ip" {
  description = "Jenkins server public IP — open this in browser"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_url" {
  description = "Access Jenkins UI at this URL"
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "ssh_command" {
  description = "Use this command to SSH into Jenkins server"
  value       = "ssh -i ~/.ssh/<your-key>.pem ubuntu@${aws_instance.jenkins.public_ip}"
}
