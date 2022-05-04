output "beanstalk-endpoint" {
  value = aws_elastic_beanstalk_environment.demo_web_app_demo.cname
}