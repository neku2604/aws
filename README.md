# aws

# Project details 
This is basic aws repo having terraform code to provionsion AWS resources 
:-Prerequisite
    -AWS account
    -Install the AWS CLI

Now start with creating a vpc using terraform..

-Firstly run this command in terraform 
    -aws --version
    -terraform --version

Now, configure AWS credentials
    -Once you’ve created your new directory, it’s time to configure Terraform to work with your AWS account.

Create a Terraform User
    -To configure Terraform and AWS to work together, you need to log into your AWS Management Console with a user account that can create other users (ie a root AWS account or an account with administrator access):
    -You need the IAM user as that is what Terraform will use to read and update your AWS environment. This IAM user will perform the actions specified by your Terraform commands.

Once logged in, select IAM: 
        -Click on Users to open the users’ console;
        -And then select Add users in the upper right-hand corner:
        -This opens up the Create user page where you can specify the user details. Give the user a name (ie terraform-user) and make sure you leave the “Provide user access to the AWS Management Console” unchecked, as you don’t need access to this:
        -Click on Next to set the permissions. Then under Permissions options, select Attach policies directly, and under Permissions policies, tick the checkbox next to AdministratorAccess. This gives the user the permissions they need to create any resource with Terraform:
        -Scroll down to the bottom of the page and click on Next to review and create the user.
        -To view the new user’s details, you can click on View user on the confirmation at the top of your screen, or you can select the new username in your list of users.

        -On the terraform-user details page, select Security credentials:
        -Then scroll down to the Access keys section and select Create access key:
Build the VPC
        -Navigate to the project directory that you created previously (ie terraform-vpc-demo) and create main.tf and resources.tf files in it. The main.tf file contains all the VPC configurations, and the resources.tf file contains all the configurations of the resources you create in the VPC.





Managed by Neha