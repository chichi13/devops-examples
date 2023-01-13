# Terraform

For more compatibility, `.terraform.lock.hcl` has been pushed with the following lock configuration :

```bash
terraform providers lock \
    -platform=windows_amd64 \
    -platform=darwin_amd64 \
    -platform=linux_amd64 \
    -platform=darwin_arm64 \
    -platform=linux_arm64
```
