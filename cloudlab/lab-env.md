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

## Clone the CloudLab Repo and Launch in Codespaces

1. Press this [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/CloudNetworking101) button to get started.

2. Accept the defaults and let the new Codespace spin up, it's based on this repo and has the all the packages we need installed for our lab.

> [!NOTE]
> This lab will have you make modifications to the code in the repository in order to stand up your cloud environment(s). If you wish to save those modification you can commit those modifications and Codespaces will fork the original repository and save your modifications to a new repo in your account.

## Setup Codespaces Secrets

Following these steps to setup Codespaces Secrets:

1. Click on S





Now that we have our Codespace linux container we can create a ssh key to use for the Linux lab machines in the CSPs.
To generate an ssh key run the following and leave the passphrase empty.

```bash
cd ~./ssh/
ssh-keygen -f one-ring
```
