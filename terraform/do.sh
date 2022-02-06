rm -f output.tf
terraform plan -out output.tf
terraform apply "output.tf"
