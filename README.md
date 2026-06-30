# Infraestructura - Despacho (EP3 - EKS + RDS)

Este repositorio contiene un esqueleto para desplegar la infraestructura necesaria en AWS
para la EP3 usando Terraform. Está pensado como punto de partida: debes revisar y adaptar
las variables, los tamaños de instancias y las políticas de IAM a tu cuenta.

Contenido:
- `main.tf` - recursos principales (VPC, EKS, RDS, ECR) (esqueleto).
- `variables.tf` - variables para parametrizar el despliegue.
- `outputs.tf` - salidas útiles (endpoints, ARNs).
- `.github/workflows/terraform.yml` - workflow para plan/apply con Terraform (requiere secretos).

Notas importantes (estudiante):
- No ejecutes `terraform apply` sin revisar el plan. RDS y EKS generan costes.
- Usa IAM roles restringidos y OIDC para GitHub Actions (mejor que subir claves estáticas).
- En producción: separar módulos, versionar el state en S3 con locking en DynamoDB.

Secrets/Variables necesarias en GitHub (Settings -> Secrets):
- AWS_ACCESS_KEY_ID y AWS_SECRET_ACCESS_KEY (si no usas OIDC)
- AWS_REGION
- S3_BACKEND_BUCKET (si vas a usar backend remoto)

Ejemplo rápido local (pruebas):

```bash
# Inicializar terraform
terraform init
# Ver el plan (muy importante)
terraform plan -var="region=us-east-1"
# Si todo está bien, aplicar (cuidado con los costes)
terraform apply -var="region=us-east-1"
```
