# Lab 3: Using Terraform with Multiple Clouds

Regardless of which CSP we are working with the workflow to build out the lab with the Terraform plans is the same.

## To provision the AWS lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/aws`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This will take a while but should build out the base environment and spin up an instance that we can ssh into.

Verify:

- Can you SSH to the instance?
- Does the instance have access to ping/traceroute via the IGW?

## To provision the Azure lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/azure`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This one take the longest of all the lab environments to build out (up to 45 minutes), the VNG can take quite some time to provision.

Verify:

## To provision the Google Cloud lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/google`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This one is pretty quick, resources should become available pretty quickly.

Verify:

- Can you ssh to the VM?
- Can the VM ping/traceroute out the IGW?

## To provision the Oracle Cloud lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/oracle`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This one is also very quick to provision.

Verify:

- Can you SSH to the Ubuntu instance?
- Does the instance have access to the Internet via the IGW?