# Vault Demo - Using EnvConsul to read secrets into environment variables

A demonstration of how envconsul can be used to to read secrets from HashiCorp's Vault centralised secret management tool.

This is all built using both Vagrant and VirtualBox.

To run it once you've installed the above pre-requisites simple clone this repo and perform a vagrant up. For example

``` bash
git clone git@github.com:allthingsclowd/vault_envconsul.git
cd vault_envconsul
vagrant up
```

Now read the output.
The Vagrantfile installs HashiCorp's Consul, Vault and EnvConsul.
It then creates a secret in Vault and uses EnvConsul to read it back into an environment variable which a sample script then displays.

## TODO

* Create a vagrantfile that installs:
    * Consul, Vault, Envconsul
    * Write a secrets into Vault
    * Read the secret back using EnvConsul

### Refactor



### A

* 

## Done

