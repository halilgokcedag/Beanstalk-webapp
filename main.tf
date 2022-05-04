data "aws_elastic_beanstalk_solution_stack" "node_js" {
  most_recent = true

  name_regex = "^64bit Amazon Linux (.*) running Node.js (.*)$"
}

# Create key pair for EC2 instances
resource "aws_key_pair" "keypair" {
  key_name   = var.key_name
  public_key = file("${path.cwd}/${var.ssh_public_key}")
}

# Create elastic beanstalk application

resource "aws_elastic_beanstalk_application" "demo_web_app" {
  name        = "demo-web-app"
  description = "demo web app"
}

resource "aws_elastic_beanstalk_environment" "demo_web_app_demo" {
  name                = "demo-web-app-env"
  application         = aws_elastic_beanstalk_application.demo_web_app.name
  solution_stack_name = data.aws_elastic_beanstalk_solution_stack.node_js.name
  tags = {
    "Stage" = "Demo"
  }
  tier = var.tier
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = module.vpc.vpc_id
  }

  #https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.html
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "True"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", [module.vpc.public_subnets[0],module.vpc.public_subnets[1],module.vpc.public_subnets[2]])
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.MinSize
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.MaxSize
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = aws_key_pair.keypair.id
  }
}