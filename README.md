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
    :-code in main.tf
        -This code sets the provider as AWS. A provider is a plugin that lets Terraform manage an external API, which in this case is AWS. It also creates an Amazon VPC called demo-vpc with a cidr_block and a tag called demo-vpc defined.
    :-Create Subnets
        -Subnets are created in an AWS VPC to segment the VPC’s IP address range into smaller, more manageable blocks, providing isolation and fault tolerance. Subnets also allow you to distribute resources across different availability zones, enhancing the high availability of your applications and services in the cloud.
    :-code in creating subnets
        -This creates four subnets: two private subnets and two public subnets, one for each of the availability zones, eu-west-1a and eu-west-1b. Private and public subnets are necessary in an AWS VPC to separate resources with different levels of internet accessibility. Public subnets allow resources to have direct internet access, while private subnets restrict internet access, providing an additional layer of security for sensitive or internal resources.

        The line vpc_id = aws_vpc.demo-vpc.id specifies that the newly created subnet, named public-subnet-2, will be associated with the VPC identified by the resource demo-vpc from the AWS provider. The .id at the end retrieves the unique identifier (ie ID) of the VPC resource to establish an association between the subnet and the corresponding VPC in the same AWS region.
    :-Create an Internet Gateway
        -Specifying the VPC ID associates this internet gateway with the demo-vpc VPC. Currently, you only have the default internet gateway:

    :-Create a Third Route Table and Associate Public Subnets
        -you need to create a third route table and associate the public subnets with this table so that the public subnets can be publicly accessible over the internet.
        To do so, add the following configuration in the main.tf file:

    :-Create a NAT Gateway
        -This configuration creates an Elastic IP address that is used to create the NAT gateway (ie nat-gateway). Apply the configuration, and you should see that the Elastic IP address and NAT gateway were created:

    :-Configure Security Groups
        -By configuring the security groups in this way, web-sg allows incoming HTTP traffic from anywhere, and db-sg only allows incoming database traffic from the specified private subnets. This helps to ensure the appropriate security and restricts access to services such as databases.





Managed by Neha