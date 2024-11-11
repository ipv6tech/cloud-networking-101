# Let's Get started

The labs leverage Github Codespaces with Terraform plans to build out basic environments for each CSP so we aren't spending out time together doing click-ops provision of a base environment. Specifically we will leverage Github Codespaces with a prebuilt, custom devcontainer to avoid spending time installing tools and configuring stuff on your laptop.

Lab 1: Using Internet2 Insight Console

Lab 2: Using Github Codespaces

- Starting a new Codespace
- Setting up the lab environment
  - Setting secrets and environment variables
  - Authenticating CLI tools with each CSP

Lab 3: Terraform deployment of CSP Lab environments

Lab 4: Building Dedicated Connections to the Cloud

Lab 5:

We will focus the lab work on playing with the networking components, configuring routing, and testing/verifying the connectivity we build in this lab.

> [!NOTE]
> It's possible to clone the [workshop repo](https://github.com/ipv6tech/CloudNetworking101) and bootstrap the cloud environments from your local device but that is out of scope for this workshop. The directions that follow assume you'll use Github Codespaces.

## Setup Codespaces Secrets

[![Codespaces Prebuilds](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds/badge.svg)](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds)

For each CSP that you wish to work with we have some prep work we can do while we wait for codespaces to finish spinning up our devcontainer environment.

We will need to create credentials for the CLI tools and terraform to create an environment.

> [!NOTE]
> In order to try to keep our environments secure we will use codespaces secrets for private 

> [!WARNING]
> This repo uses a `.gitignore` file to try to keep Avoid committing your terraform state and terraform  

<details>
<summary><b>Prepare AWS</b></summary>

1. Login to your AWS account
2. 

</details>

<details>
<summary><b>Prepare Azure</b></summary>

From the codespaces terminal use:

```bash
az login --use-device-code
```

And follow the directions to authenticate the azure cli tools with your account

</details>

<details>
<summary><b>Prepare Google Cloud</b></summary>

1. Create a project to contain our lab resources

1. Copy/paste the project ID into the secrets file found in the lab folder of the repository.

1. Next authenticate the gcloud cli tools with your Google Cloud account

```bash
gcloud auth login
```
Follow the directions to authenticate the gcloud cli tools with your account.

1. Next 

```bash
gcloud config set project $GC_PROJECT_ID
```

</details>

<details>
<summary><b>Prepare Oracle Cloud</b></summary>

**1. Copy the public key.**
In a Codespaces terminal, enter:

```bash
cat ~/.oci/oci_key_public.pem
```

**2. Add the public key to your user account.**
In the OCI Console's top navigation bar, click the Profile menu, and then go to User settings.
- Click API Keys.
- Click Add API Key.
- Select Paste Public Keys.
- Paste value from previous step, including the lines with BEGIN PUBLIC KEY and END PUBLIC KEY.
- Click Add.

**3. Prepare the information you need to authenticate for OCI.**

Copy the information into the secrets file in the lab folder for the repo.

Collect the following credential information from the OCI Console.
- Tenancy OCID: <tenancy-ocid>
  - In the top navigation bar, click the Profile menu, go to Tenancy: <your-tenancy> and copy OCID.
- User OCID: <user-ocid>
  - From the Profile menu, go to User settings and copy OCID.
- Fingerprint: <fingerprint>
  - From the Profile menu, go to User settings and click API Keys.
Copy the fingerprint associated with the RSA public key you made in section 2. The format is: xx:xx:xx...xx.
Region: <region-identifier>
From the top navigation bar, find your region.
From the table in Regions and Availability Domains, Find your region's <region-identifier>. Example: us-ashburn-1.
Collect the following information from your environment.
Private Key Path: <rsa-private-key-path>
Path to the RSA private key you made in the Create RSA Keys section.
Example for Oracle Linux: /home/opc/.oci/<your-rsa-key-name>.pem
</details>

## Load Secrets into Codespaces

Once we have credentials for each CSP we wish to work with we can set those as secrets for our codespace environment to use. This will keep the credentials out of our repositories.

Follow this **[how-to create codespaces secrets](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-development-environment-secrets-for-your-repository-or-organization#adding-secrets-for-a-repository)** for each of the private keys, passwords, etc for our CSP access.

## Open the CloudNetworking repo in codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/cloud-networking-101)

1. Click the badge above to create a codespace for this repository and start the Multicloud Networking Lab.

2. On the next page click `Create codespace`.

This spins up a new codespace based on this repo and has the most of the packages we will want for our lab. It will take some time (maybe 5 minutes or more) for the devcontainer in codespaces to fully provision.

> [!NOTE]
> This lab will have you make modifications to the code in the repository in order to stand up your cloud environment(s). If you wish to save those modification you can commit those modifications and codespaces will fork the original repository under your account and save your modifications as a new commit.
