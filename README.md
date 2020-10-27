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
A specific resource can be referenced as `resource.name` 
If a resource block is commented out the resource will be destroyed as well.

Used to get latest state of real infrastructure into Terraform state file 
```
terraform refresh
```
Runs automatically when running terraform plan 

## Terraform Notes

### Providers
- Terraform supports multiple providers.
- We have to specify the provider details for which we want to launch the infrastructure for.
- With provider, we also need to add authentication
- Terraform init will download plugins associated with the provider

### Resources
- Resources are references to the individual services which the provider has to offer

### Desired State and Current State

Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

Every time we create a Terraform plan, Terraform will try to converge the current state into the desired state

