# AWS Infrastructure Provisioning with Terraform

This project automates the deployment of a dedicated EC2 instances (named `"builder"`) within a pre-existing AWS VPC using Terraform. It handles instance creation, security group rules, SSH key management, and automated Docker provisioning.

---

## What Has Been Implemented

The following infrastructure components have been fully codified and deployed:

1. **Instance Creation**
   - Unfortunately not deployed within the required existing VPC: `vpc-044604d0bfb707142` (cause I lost it but deployed with recreated default VPC ).
   - Provisions a `t3.medium` instance to adequately support Docker workloads.
   - Uses the latest Amazon Linux 2023 AMI in a public subnet for external reachability.
   - Tagged the instance as `"builder"` for easy identification.

2. **SSH Key Generation and Management**
   - Automates the creation of a local 4096-bit RSA key pair.
   - The public key is uploaded to AWS as an `aws_key_pair` and assigned to the instance.
   - The private key is saved locally to `./builder-key.pem`.

3. **Security Group Configuration**
   - Attached to the instance to allow strictly defined ingress and egress traffic:
     - **Inbound SSH (Port 22):** Allowed for remote administration for users with public IP address of terraform machine only.
     - **Inbound HTTP (Port 5001):** Allowed for accessing the Python application.
     - **Outbound (All traffic):** Allowed for downloading packages, security patches, and Docker images, etc.

4. **Automated Docker Installation**
   - Utilizes Terraform's `remote-exec` provisioner to execute post-provisioning scripts.
   - Automatically installs `docker` and `docker-compose` upon creation.
   - Configures group permissions so that the default system user can execute Docker commands without using `sudo`.

---

## Instructions

* **Please change** `vpc_id` variable in `vars.tf` to `vpc-044604d0bfb707142` as required
* **If need change** `availability_zone` to availability zone of existed Subnets 

