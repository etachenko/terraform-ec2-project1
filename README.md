# Terraform Project: Amazon Linux 2 EC2 Instance in Default VPC

This project uses Terraform to provision an Amazon Linux 2 EC2 instance within the default VPC. The instance is configured with a security group to allow SSH access, making it suitable for testing and development purposes.

## Prerequisites

Before you begin, make sure you have the following installed on your machine:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0 or later)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with your AWS credentials)
- An existing AWS key pair (to SSH into the EC2 instance)

## Project Structure

The key files in this project are:

- `main.tf`: Contains the main Terraform configuration to set up the EC2 instance and security group.
- `variables.tf` (optional): Defines input variables for the project (not included in this example but recommended for flexibility).
- `outputs.tf` (optional): Defines output variables (not included in this example but can be used to output instance details).

## Getting Started

Follow these steps to set up and run this Terraform project.

### 1. Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/yourusername/terraform-ec2-instance.git
cd terraform-ec2-instance
```

### 2. Update Terraform Configuration

- Open `main.tf` and review the configuration.
- Update the following placeholders with your own values:
  - `region`: Set the AWS region where you want to deploy the instance (e.g., `us-west-2`).
  - `key_name`: Replace with the name of your AWS key pair.

### 3. Initialize Terraform

Run the following command to initialize the project and download the necessary provider plugins:

```bash
terraform init
```

### 4. Plan the Infrastructure

Use the following command to generate an execution plan. This plan shows what actions Terraform will take to create the resources:

```bash
terraform plan
```

### 5. Apply the Configuration

Apply the Terraform configuration to create the EC2 instance and security group. You will be prompted to confirm the action:

```bash
terraform apply
```

Type `yes` to confirm and create the resources.

### 6. SSH into the EC2 Instance

Once the EC2 instance is created, you can SSH into it using the public IP address provided by Terraform. Use the following command:

```bash
ssh -i /path/to/your/private-key.pem ec2-user@<EC2_PUBLIC_IP>
```

Replace `/path/to/your/private-key.pem` with the path to your private key file, and `<EC2_PUBLIC_IP>` with the actual public IP address of your instance.

### 7. Clean Up Resources

To avoid incurring costs for resources you no longer need, you can destroy the infrastructure created by Terraform:

```bash
terraform destroy
```

Type `yes` to confirm and delete all the resources.



