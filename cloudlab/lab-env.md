# Let's Get started

The hand-on portion of the lab leverages some DevOps tooling with Terraform plans to build out basic environments for each CSP so we aren't spending out time together doing click-ops provision of a base environment. Specifically we will leverage Github Codespaces with a custom devcontainer to avoid spending time building out a development environment on your local machine.

> [!NOTE]
> It's possible to clone the [workshop repo](https://github.com/ipv6tech/CloudNetworking101) and bootstrap the cloud environments from your local device but that is out of scope for this workshop. The directions that follow assume you'll use Github Codespaces.

## Requirements

- Laptop with internet access.
- Access to Internet2's [Insight Console](https://console.internet2.edu/). (Reach out if you can't login with your Institutions credentials.)
- [Github account](https://github.com/) with access to Github Codespaces.
- An account in each of the Cloud Service Providers (CSPs) you wish to use in the hands-on workshop. **_(As long as you delete the resources we build the cloud costs will be minimal for this workshop.)_**

  - [AWS Free Tier](https://aws.amazon.com/free)
  - [Azure Free Services](https://azure.microsoft.com/en-us/pricing/free-services)
  - [Google Cloud Tier](https://cloud.google.com/free)
  - [Oracle Free Tier](https://www.oracle.com/cloud/free)

> [!TIP]
> Consider creating a throw-away free-tier account using an email alias address like <email+aws-i2@gmail.com> or similar for each account.

> [!WARNING]
> Make sure you use complex passwords for your accounts and enable MFA. You don't need folks mining crypto on your dime.



## Setup Codespaces Secrets

For each CSP that you wish to work with we have some prep work we can do while we wait for codespaces to finish spinning up our devcontainer environment.

We will need to create credentials for the CLI tools and terraform to create an environment.

> [!NOTE]
> In order to try to keep our environments secure we will use codespace secrets for private 

> [!WARNING]
> Avoid commiting your terraform stateThis repo uses a .gitignore file to try to keep 

<details>
<summary><b>Prepare AWS</b></summary>

1. Login to your AWS account
2. 

</details>

<details>
<summary><b>Prepare Azure</b></summary>

</details>

<details>
<summary><b>Prepare Google Cloud</b></summary>

</details>

<details>
<summary><b>Prepare Oracle Cloud</b></summary>

</details>

Once we have credentials for each CSP we wish to work with we can set those as secrets for our codespace environment to use. This will keep the credentials out of our repositories.

Follow this **[how-to create codespaces secrets](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-development-environment-secrets-for-your-repository-or-organization#adding-secrets-for-a-repository)** for each of the private keys, passwords, etc for our CSP access. 

## Open the CloudNetworking repo in codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/CloudNetworking101)

1. Click the badge above to create a codespace for this repository and start the Multicloud Networking Lab.

2. On the next page click `Create codespace`.

This spins up a new codespace based on this repo and has the most of the packages we will want for our lab. It will take some time (maybe 5 minutes or more) for the devcontainer in codespaces to fully provision.

> [!NOTE]
> This lab will have you make modifications to the code in the repository in order to stand up your cloud environment(s). If you wish to save those modification you can commit those modifications and codespaces will fork the original repository under your account and save your modifications as a new commit.

## Generate SSH Key for our lab instances (VMs)

Now that we have our Codespace linux container we can create an ssh key to use for the virtual machines/instances we will build in the cloud.

To generate an ssh key run the following and leave the passphrase empty.

```bash
mkdir -p ~/.ssh && cd ~/.ssh && ssh-keygen -f one-ring
```
