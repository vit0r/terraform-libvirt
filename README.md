# Terraform libvirt - local tests KVM server

1. [virtualization-libvirt](https://ubuntu.com/server/docs/virtualization-libvirt)
2. [provider docs](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs)
3. [cloud-init](https://cloudinit.readthedocs.io/en/latest/reference/examples.html)

## Usage

### ssh-keygen

```console
ssh-keygen -t ecdsa -b 521 -C "topeira" -f ~/.ssh/terraformlibvirt
```

### Terraform

```console
terraform init

terraform plan -no-color > plan.log

terraform apply -auto-approve

terraform destroy
```

### Login

```console
# ubuntu
ssh ubuntu@192.168.123.X -o IdentitiesOnly=yes -i ~/.ssh/terraformlibvirt

# centos
ssh cloud-user@192.168.123.X -o IdentitiesOnly=yes -i ~/.ssh/terraformlibvirt
```
