# ec2-customvpc-terraform
Provision an Amazon EC2 instance in a custom VPC using Terraform


Project Description

You have a cloud management team, and they are in charge of deploying. You deploy an Amazon EC2 instance inside a custom VPC just for your team and you are to add this instance inside a public subnet making it accessible to the public using IaC (Terraform).


What is Terraform?

Terraform is an infrastructure-as-code (IaC) tool through which you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse and share across various cloud platforms as well as on-premises. 
Terraform allows you to quickly automate and deploy resources on-prem and in the cloud. In my first project, I provisioned an Amazon EC2 instance in a custom VPC manually via the AWS console. This was time consuming and when I deleted all the resources deployed in the project, I would have to start all over again. But, with Terraform, it is all about automation. By creating a Terraform a module with configuration files, we can create reproducible infrastructure. Even when the resources are deleted, they can be reproduced easily and quickly because the codes are reusable.

Terraform code is stored in the .tf or .tfjson file extension and the syntax is written in Hashicorp Configuration Language.

Architecture Diagram

![image](https://user-images.githubusercontent.com/74336816/215671409-7dcf4b40-9f3a-43dd-975a-56e923d12e12.png)


Prerequisites
1. AWS account
2. AWS CLI 
3. VS Code 
4. Terraform Installed
5. Git account

To begin, launch VScode and create a terraform module with the following configuration files needed by Terraform to create our resources; main.tf, variable.tf and output.tf

The following tasks will be performed
1. Clone the GitHub repo to push the configuration files to
2. Create a custom VPC
3. Create a public subnet
4. Configure and launch an ec2 instance inside the custom VPC.
5. Add user data
6. Attach a security group to the ec2 instance created
7. Initialize Terraform and provider plugins
8. Check the plan – the changes required by the configuration
9. Launch the EC2 instance
10. View the website and other resources Terraform created
11. Delete the provisioned resources
12. Add configuration files to the remote repository


Task 1: Clone the GitHub repo

Clone the GitHub repo and change to the initialized directory. Then, create the main.tf, variable.tf and output.tf configuration files and start writing configuration codes to provision the resources needed to build our infrastructure.

![image](https://user-images.githubusercontent.com/74336816/215671717-59a2d31e-0c0a-475c-ac35-7dbb8a71d8a3.png)


![image](https://user-images.githubusercontent.com/74336816/215671743-bd01031a-b833-4a4c-88b7-da3917a848b4.png)
