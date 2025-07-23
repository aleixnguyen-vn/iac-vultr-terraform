# Infrastructure as Code with Vultr

[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Vultr](https://img.shields.io/badge/Vultr-007BFF?style=for-the-badge&logo=vultr&logoColor=white)](https://www.vultr.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

# Terraform Vultr Auto-Provisioning Demo 🚀

A basic Infrastructure as Code (IaC) demo leveraging **Terraform** and **cloud-init** to fully automate the provisioning of a Vultr VPS. The setup includes OS installation, SSH key registration, Docker installation, Git repository cloning, and automatic service deployment.

This setup is designed to provision the infrastructure used by the Github Actions deployment pipeline in this repository:
- 👉 [**Docker-based Nginx/PHP-FPM Auto-Deploy with Github**](https://github.com/aleixnguyen-vn/docker-nginx-github)

Once the server is provisioned, the Github Actions auto-deploys the application stack via SSH.
---

## ✅ What It Does

* **Provisions a Vultr Instance** with:

  * 📀 **OS:** Ubuntu 24.04
  * 💻 **Specs:** 1 vCPU, 1GB RAM, 25GB SSD
  * 🌍 **Region:** Amsterdam (AMS)

* **Injects Your SSH Public Key** automatically

* **Runs an Init Script via Cloud-Init** to:

  * Install Docker
  * Setup UFW firewall
  * Clone a specified Git repository

---

## 🧠 How to Use

### 1. Install Terraform

[Download Terraform](https://developer.hashicorp.com/terraform/downloads) and install it.

### 2. Export Your Vultr API Key

```bash
export TF_VAR_vultr_api_key=your_api_key_here
```

### 3. Prepare Your SSH Key (Public)

Make sure your public key exists at `~/.ssh/deploy_key.pub` or update the path in `main.tf`.

### 4. Clone This Repository

```bash
git clone https://github.com/aleixnguyen-vn/iac-vultr-terraform.git
cd iac-vultr-terraform
```

### 5. Run Terraform

```bash
terraform init       # Initialize Terraform configuration
terraform plan       # Show the execution plan
terraform apply      # Provision the VPS and auto-deploy your app
```

After `apply`, Terraform will:

* Create a VPS on Vultr
* Inject your SSH key
* Auto-run `init-script.sh` to install Docker, clone repo, and deploy app

### 6. Optional: Clean Up Resources

```bash
terraform destroy    # Remove all provisioned infrastructure
```

---

## 📸 Screenshots

### 🔧 Terraform Output (Provisioning Success)

*Terminal output showing instance creation and IP address.*

![Terraform Apply Output](screenshots/terraform.png)

### 🌐 Vultr Dashboard View

*Dashboard verifying instance configuration and IP.*

![Vultr VPS Details](screenshots/vultr_dashboard.png)

---

## ⚠️ Important Notes

* 🔐 **Security First:** Never hardcode secrets or API keys in your code.
* 🔁 **Repeatable:** This setup can be reused across environments with minor changes.
* 🚀 **CI/CD Ready:** You can integrate this IaC into your GitLab pipeline for full automation.

---

**Author:** [@aleixnguyen-vn](https://github.com/aleixnguyen-vn)

---

Need help extending this to multi-node, monitoring, or auto-scaling? PRs and issues are welcome!
