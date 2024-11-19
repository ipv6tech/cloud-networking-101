# Lab 4: Terraform deployment of CSP lab environments

Regardless of which CSP we are working with the workflow to build out the lab with the Terraform plans is the same.

This is a fun one and hopefully all the prep work we've done up to this point will pay off and make this part run smoothly. It's a pretty awesome feeling to provision and removing an environment with IaC with a few commands.

> [!TIP]
> Want to provision multiple environments at once, just open another shell and get the next environment going.

> [!CAUTION]
> We are saving state for our environments locally, this is not a best practice and should never be done for a production environment. Make sure to not delete your Codespace instance until you've completely removed the lab environments for your cloud(s) otherwise you'll need to manually remove all the resources in the console(s).

<details>
<summary><b>Prepare AWS</b></summary>

## To provision the AWS lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/aws`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This will take a while but should build out the base environment and spin up an instance that we can ssh into.

Verify:

- Can you SSH to the instance?
  - This terraform plan should create an SSH config entry so you can use the Codespace shell to run `ssh i2lab-aws`.
- Does the instance have access to ping/traceroute via the IGW?

</details>

---

<details>
<summary><b>Prepare Azure</b></summary>

## To provision the Azure lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/azure`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This one take the longest of all the lab environments to build out (up to 45 minutes), the VNG can take quite some time to provision.

Verify:

- Can you SSH to the instance?
  - This terraform plan should create an SSH config entry so you can use the Codespace shell to run `ssh i2lab-azure`.
- Does the instance have access to ping/traceroute via the IGW?

</details>

---

<details>
<summary><b>Prepare Google Cloud</b></summary>

## To provision the Google Cloud lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/google`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This one is pretty quick, resources should become available pretty quickly.

Verify:

- Can you SSH to the instance?
  - This terraform plan should create an SSH config entry so you can use the Codespace shell to run `ssh i2lab-google`.
- Does the instance have access to ping/traceroute via the IGW?

</details>

---

<details>
<summary><b>Prepare Oracle Cloud</b></summary>

## To provision the Oracle Cloud lab environment

1. In the Codespaces shell run `cd $CODESPACE_VSCODE_FOLDER/lab/oracle`.
2. Next run `terraform init`. It should show that "Terraform has been successfully initialized!"
3. Next run `terraform plan`. 
4. Next we will run `terraform apply -auto-approve`.

This one is also very quick to provision.

Verify:

- Can you SSH to the instance?
  - This terraform plan should create an SSH config entry so you can use the Codespace shell to run `ssh i2lab-oracle`.
- Does the instance have access to ping/traceroute via the IGW?

---

## :rocket: [Take me to Lab 5](lab5.md)
