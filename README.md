# Beanstalk-app

This is a small Beanstlak project that deploys 3 EC2 instances and a new VPC.

**Warning: You may be charged by AWS to run this deployment.**

### Built With

* Terraform
* AWS Beanstalk
* AWS VPC

### Prerequisites

- This deployment can be deployed to an AWS environment. AWS account is required to run this deployment. Use the following link to create an access key and a secret access key.
  - [Managing access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

- aws cli, Git and Terraform are reqired for this deployment. 

- When you create an environment, AWS Elastic Beanstalk requires a Service role and an Instance profile. If these objects exist, they can be assigned to the new environment. Otherwise, you need to create them. Check this [link](https://github.com/halilgokcedag/Beanstalk-permissions-with-Terraform) to create them.

- SSH public key is required with the name of demokey.pub. Create an SSH key and copy it to the root level of the code. To create an SSH key, use this [link](https://www.ssh.com/academy/ssh/keygen).

### Deployment

1. Clone the repo and go to the deployment directory.

```
git clone https://github.com/halilgokcedag/Beanstalk-webapp.git
cd Beanstalk-webapp
```

2. Open a terminal and run 'aws configure' to enter AWS keys on your computer. Choose region as us-east-1.

```
aws configure
```

3. Initialize the working directory.
```
terraform init
```

4. Run the below command to create an execution plan and review it.
```
terraform plan
```


5. Run the below command to execute the plan and enter yes when prompted.
```
terraform apply
```

6. After a successful apply, output will provide a endpoint for the application. Copy and try it on a browser to see the application.


### Cleanup
1. If the deployment is not needed anymore, run the following command to delete the deployment. Enter yes when prompted.

```
terraform destroy
```


