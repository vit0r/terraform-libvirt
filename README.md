# Terraform libvirt - local tests KVM server

1. [provider docs](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs)
2. [cloud-init](https://cloudinit.readthedocs.io/en/latest/reference/examples.html)

## Usage

### ssh-keygen

```console
ssh-keygen -t ecdsa -b 521 -C "ubuntu" -f ~/.ssh/terraformlibvirt
```

### Terraform

```console
terraform init

terraform plan -no-color > plan.log

terraform apply -auto-approve

terraform destroy
```
