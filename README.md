# terraform-scripts

## Important commands

Used to initialize project :
```
terraform init
```

Used to generate project plan :
```
terraform plan
```

Used to apply project plan :
```
terraform apply
```

Used to destroy a specific resource
```
terraform destroy -target {resource.name}
```
a specific resource can be referenced as `resource.name` 
If a resource block is commented out the resource will be destroyed as well.


## Terraform Notes

### Providers
- Terraform supports multiple providers.
- We have to specify the provider details for which we want to launch the infrastructure for.
- With provider, we also need to add authentication
- Terraform init will download plugins associated with the provider

### Resources
- Resources are references to the individual services which the provider has to offer
