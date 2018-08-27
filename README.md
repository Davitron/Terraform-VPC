# Terraform-VPC

##  About
Terraform-VPC is a project that contains scripts that set up network configurations for a web application, database and a loadbalancer on AWS using [`terraform`](https://www.terraform.io/)

### Guidelines
The following guidelines describe the process of creating a custom network(VPC) using this terraform scripts

1. Clone the repository and `cd` into `Terraform-VPC` directory

    ```
      git clone https://github.com/Davitron/Terraform-VPC
      cd Terraform-VPC
    ```
2. The major prerequisite to run a terraform file, is the terraform cli. This package has to be installed.
  	>- You can install terraform using [`homebrew`](https://brew.sh/) by running `brew install terraform`.

3. After the installation of terraform, the next step is to run the following command `terraform init` to initialize Terraform
  
4.  Having initialized terraform, it is important specify our `AWS secret and access key`. To get this done, you can create a credential file preferably in the `~/.aws/` directory just like this `~/.aws/credentials`

	```
	[default]
	aws_access_key_id = AWS ACCESS KEY ID
	aws_secret_access_key = AWS SECRET KEY
	```

5.  To be able to access the instances created by terraform, it is imperative to have create a keypair with any name. You can follow the instruction below to create a keypair
    >- On your AWS management console, click on the `Services` drop-down, under the `Compute` section click on EC2.
    >- On EC2 dashboard, By the side-navigation bar under `NETWORK & SECURITY` section, click on `Key Pairs`.
    >- Click on the button with `Create Key Pair` description and input whatever name you want as the key pair name value.

6. Change the `key_name` attribute in the following files to the name of the key_pair created above. `app_instance.tf`, `database_instance.tf` and `nat_instance.tf`
   
7. Run the `terraform apply` commmand to create the following resouces on AWS
    - A VPC with a private and public subnet
    - Route table to determine where network traffic is directed.
    - Internet gateway for connecting to the internet
    - Database created in the private subnet
    - Application and NAT instance created in the public subnet
    - Loadbalancer for both the API and Web application