# Lab 2: Using GitHub Codespaces

[![Codespaces Prebuilds](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds/badge.svg)](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds)

In this Lab we will start up our GitHub Codespace with the Lab repository that will allow us to create a base cloud environment with each provider we'd like to build connectivity and test with. This will require access to your Cloud Service Provider accounts to create access credentials for the command line tools that the Terraform plans will use to provision the base cloud environments.

This Codespace includes a custom, prebuilt, devcontainer that has the following packages preinstalled for us.

1. AWS CLI
2. Azure CLI
3. Google Cloud SDK
4. Oracle Cloud CLI
5. Terraform

> [!NOTE]
> While it is possible to clone or fork the [Cloud Networking 101](https://github.com/ipv6tech/cloud-networking-101) workshop repository and bootstrap the cloud environments from your local device but the steps in this guide walk you through use GitHub Codespaces under your GitHub account.

---

## Starting GitHub Codespaces

You can use the easy :arrow_down: button

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/cloud-networking-101)

or follow these manual steps :arrow_down:

1. To get started sign in to your [GitHub](https://github.com/login) account.
2. Navigate to the [Cloud Networking 101](https://github.com/ipv6tech/cloud-networking-101) workshop repository.
3. Select `Code`, `Codespace`, `Create codespaces on main`.
![image](files/start_codespaces.png) This should open a new window and start to spin up your new Codespace.

---

## Setting up the lab environment

>[!TIP] Before we start!
>To save on time and frustration, only setup the cloud providers you actually want to use in the lab.

### Setting secrets and environment variables

In the repository there is a template secrets file that will help with this step. This will help with authenticating with the CSP's but also be used in the terraform plans to provision resources for our base environment so we don't have to edit a bunch of files for each provider.

Once we have credentials for each CSP we wish to work with we can set those as secrets for our codespace environment to use. This will keep the credentials out of our repositories.

Follow this **[how-to create codespaces secrets](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-development-environment-secrets-for-your-repository-or-organization#adding-secrets-for-a-repository)** for each of the private keys, passwords, etc for our CSP access.

---

### Authenticating CLI tools with each CSP

I'm not going to lie, this is going to be a bit of a slog for some of the providers. The easiest ones are AWS, Azure and Google in that order. Oracle is a bit more of a process.

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

