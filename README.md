# Testing Jenkins.....

# Provision an Amazon EC2 instance in a custom VPC using Terraform   

Project Description

You have a cloud management team, and they are in charge of deploying. You deploy an Amazon EC2 instance inside a custom VPC just for your team and you are to add this instance inside a public subnet making it accessible to the public using IaC (Terraform).


What is Terraform?

Terraform is an infrastructure-as-code (IaC) tool through which you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse and share across various cloud platforms as well as on-premises. Terraform is an IaC tool for automating infrastructure deployment of cloud resources.
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





Task 2: Create a custom VPC

The variable.tf file has the configuration for our variables used in the main.tf file. And on the main.tf file, we have the resource block for the custom VPC as shown below;

- variable.tf

![image](https://user-images.githubusercontent.com/74336816/215726535-e367bed5-0dce-4778-a46b-5fd3fd71951f.png)

- main.tf

![image](https://user-images.githubusercontent.com/74336816/215726673-0c41db33-595f-44ec-8353-9c49597291b5.png)




Task 3: Create a Public subnet

A public subnet on the VPC is where our EC2 instance will be created to make it accessible the public.

- main.tf

![image](https://user-images.githubusercontent.com/74336816/215727012-7b74e50a-e0dd-4ba9-9072-4558086dd45e.png)




Tasks 4, 5 and 6: Configure the ec2 instance 

Configure the ec2 instance inside the public subnet of the custom VPC, attach a Security Group to the instance and add userdata.

- main.tf

![image](https://user-images.githubusercontent.com/74336816/215727270-0d3defdd-01e7-4ab3-949b-ec86000fee6d.png)

![image](https://user-images.githubusercontent.com/74336816/215727375-281778e7-9e8b-44e3-930d-ec7d9326712f.png)

![image](https://user-images.githubusercontent.com/74336816/215727507-23883dcd-fdb2-48da-b38c-1f7ace145d47.png)

![image](https://user-images.githubusercontent.com/74336816/215727552-3a24a74d-d85f-459f-b1cf-956f8da79be8.png)


From the instance resource block in the main.tf file, we added a user_data with a bashscript to install an Apache webserver on the instance at launch and we will be able to view our webpage with the contents in the index.html file configured.





Task 7: Initialize Terraform and provider plugins

Run terraform init to initialize our Terraform infrastructure and provider plugin

![image](https://user-images.githubusercontent.com/74336816/215727752-57ad4602-4075-4a15-8688-220656338854.png)





Task 8: Check the changes required by the current configuration

Run terraform validate to check if the configuration is valid, then, terraform plan to show changes required by the current configuration.

![image](https://user-images.githubusercontent.com/74336816/215727968-8a3a1cf0-2de1-40b2-b17f-2764a99613fc.png)

$ terraform plan

![image](https://user-images.githubusercontent.com/74336816/215728106-b37aeb1a-4504-42b3-844a-9dd2a44c0c43.png)





Task 9: Launch the EC2 instance

To launch the EC2 instance, we run terraform apply and select yes when prompted. This creates and launches our EC2 instance and all the other resources in the configuration plan.
Also, we created an output.tf file which displays our website url after instance is launched with terraform apply.

- output.tf

![image](https://user-images.githubusercontent.com/74336816/215728302-42edb353-9887-43ec-9472-091bcd9c8bfb.png)


Result after running terraform apply

![image](https://user-images.githubusercontent.com/74336816/215728411-094030d6-16c1-4e1e-a1b6-9e8f4022639e.png)

![image](https://user-images.githubusercontent.com/74336816/215728473-1ca9f1e3-b94c-48bd-bf55-8be8146077c6.png)




Task 10: View the website and other resources Terraform created

Verify the other resources created via the AWS Management console.
    
a). The custom VPC

![image](https://user-images.githubusercontent.com/74336816/215728778-6cbf7abc-bdaf-41f8-89a0-afa0a6c46dd4.png)

b). Public and private subnets

![image](https://user-images.githubusercontent.com/74336816/215728960-b7c3625c-0f08-49c4-bdeb-1f2273b94cc9.png)

c). Security group

![image](https://user-images.githubusercontent.com/74336816/215729082-9f58fb63-7511-4d64-9d6b-3b194f0ef3ab.png)

Copy the displayed url from the terminal on VScode or navigate to the AWS console  Services  EC2  Instances New. Select the instance, copy the displayed Public ipv4 address and place in your browser to view the configured webpage.

![image](https://user-images.githubusercontent.com/74336816/215729219-91be1bae-08d0-4d23-9d2c-2f707af67c2f.png)

![image](https://user-images.githubusercontent.com/74336816/215729303-3880c989-b561-4927-9b52-8d51defbfb2e.png)





Task 11: Delete the resources

On the VScode terminal, run terraform destroy to delete the created resources, type yes when prompted. All the created resources are deleted automatically.

![image](https://user-images.githubusercontent.com/74336816/215729491-7451b2cb-2bd7-476a-bf4d-d57d1abab3a1.png)

![image](https://user-images.githubusercontent.com/74336816/215729572-3f5c9842-f57f-48b4-bf11-edee3b8ef574.png)





Task 12: Add the configuration files and push to GitHub

Add the main.tf, output.tf and variable.tf configurations files to the staging area and commit to the local repository. Then push to the remote repository on GitHub.


![image](https://user-images.githubusercontent.com/74336816/215729774-33468878-7bcc-459d-af33-cc25fa8c09a4.png)

![image](https://user-images.githubusercontent.com/74336816/215729820-e9749d27-6338-4511-8305-163caaf1d2cc.png)

![image](https://user-images.githubusercontent.com/74336816/215729891-7a2e5850-950f-402e-97c3-430344d91b8b.png)


Confirm that the configuration files have been added to the remote repository on GitHub.

![image](https://user-images.githubusercontent.com/74336816/215729999-724f0e98-0d89-4a4b-8bec-b45a0b745e7b.png)




Conclusion

We have been able to provision an Amazon EC2 instance in a custom VPC using Terraform. We also installed an Apache web server on our instance and made it accessible to the public. In the previous project where we provisioned the instance via the AWS console, the deployment process was slow – we spent time manually deploying each resource needed to complete the project. But with Terraform, we were able to automate the deployment of our infrastructure very quickly and easily simply by using codes in our configuration files. These files are version-controlled and reusable. So, we can at any time tear down the infrastructure and re-build it again whenever we make changes to the files.   



Thanks for reading!


