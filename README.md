This project demonstrates how to deplopy a **static-website** on  **AWS-S3** using **Terraform** with public-access and version-controlled infrastructure. Perfect for learning **Infrastructure as Code (IaC)** using Terraform — beginner-friendly and CI/CD ready!

---

## 🚀 What This Project Does

- Creates an S3 bucket to host a static website
- Sets the correct ownership controls (BucketOwnerEnforced)
- Configures public-read access via bucket policies
- Uploads your website files (HTML/CSS/JS)
- Uses **GitHub Actions** to automate deployment on every push

---

## 🛠️ Tech Stack

- **Terraform** (v1.11.4)
- **AWS S3**
- **GitHub Actions** for CI/CD
- **HCL** (HashiCorp Configuration Language)

---

## 📁 Project Structure

```bash
.
├── index.html                # Your static website's homepage
├── main.tf                   # Main Terraform configuration
├── variables.tf              # (Optional) Terraform variables
├── outputs.tf                # (Optional) Terraform outputs
├── .gitignore                # Ignore local files like .terraform
└── .github/
    └── workflows/
        └── terraform.yaml    # GitHub Actions for CI/CD
