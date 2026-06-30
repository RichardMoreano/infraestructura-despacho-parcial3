// Esqueleto Terraform - crea recursos básicos (VPC/EKS/RDS/ECR)
// Reemplaza y adapta según tus necesidades. No ejecutar en producción sin auditar.

terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = var.region
}

// Aquí se crearían: VPC, subnets, RDS, EKS cluster, ECR repos
// Por simplicidad este fichero es un placeholder. Implementar módulos reales.
