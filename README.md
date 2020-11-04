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

Used to see the contents of tfstate files:
```
terraform show
```

## Terraform Notes

### Providers
- Terraform supports multiple providers.
- We have to specify the provider details for which we want to launch the infrastructure for.
- With each provider, we also need to add authentication
- Terraform init will download plugins associated with the provider

### Resources
- Resources are references to the individual services which the provider has to offer

### Desired State and Current State

`Desired State`. The state of a resource as specified in its terraform definition.
`Current State`. The state of a resource as its currently in real world.

Every time we create a Terraform plan, Terraform will try to converge the current state into the desired state.

## Attributes And Output values

`Output values` are like the return values of a Terraform module, and have several uses:
 - Expose a subset of its resources attributes to a parent module
 - Print values to CLI
 
`Attributes` are a named piece of data that belongs to some kind of object

## Variables

`Variable` this is a way to reuse values across a terraform project. Values can be assigned in multiple ways: 
- Environment variables
- Command line flags
- From a file (`terraform.tfvars`)
- variable defaults

Following types have been identified: 
- `string`
- `number`
- `list`

`count` object can be used to create multiple resources without having to repeat the code. 
With `count.index` we can add specific tags or names per each of the resources created.

## Conditional expressions

A conditional expression uses the value of a bool expression to select one of two values.

The syntax of a conditional expression is as follows:
```
condition ? true_val : false_val
```

## Local values

Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration. 

If overused they can also make the configuration hard to read (recommended to use in moderation)

Example: 
```
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
```

## Datasources

Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. Use of data sources 
allows a Terraform configuration to make use of information defined outside of Terraform

Example:
```
data "aws_ami" "ecs_ami" {
  most_recent = true
  owners = [
    "amazon"]

  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm*"]
  }
}
```

## Dynamic Blocks

Dynamic Block allows us to dynamically construct repeatable nested blocks which is supported inside resource, 
data, provider, and provisioner blocks. Example: 

```
resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
```

## Provisioners

Provisioners execute scripts on a local or remote machine as part of resource creation or destruction.
For instance, a provisioner can install a web server after creating a EC2 instance: 

```
resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   key_name = "kplabs-terraform"

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./kplabs-terraform.pem")
     host = self.public_ip
   }
   }
}
```
