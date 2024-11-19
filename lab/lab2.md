# Lab 2: Using GitHub Codespaces

![Codespaces Prebuilds](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds/badge.svg)

## Objective

In this Lab we will start up our GitHub Codespace with the Lab repository that will allow us to create a base cloud environment with each provider we'd like to build connectivity and test with. This will require access to your Cloud Service Provider accounts to create access credentials for the command line tools that the Terraform plans will use to provision the base cloud environments.

This Codespace includes a custom, prebuilt, devcontainer that has the following key packages preinstalled.

1. GitHub CLI
2. AWS CLI
3. Azure CLI
4. Google Cloud SDK
5. Oracle Cloud CLI
6. Terraform

---

## Starting GitHub Codespace

>[!NOTE]
> We start the Codespace from the original repository in order to take advantage of the prebuilt devcontainer and save time. However this will necessitate [forking to save changes](#forking-to-save-changes) which is covered in the next section.

Click below :arrow_down: to get started :rocket:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/cloud-networking-101)

---

### Forking to save changes

>[!IMPORTANT]
> Make sure to do these steps carefully otherwise when the Codespace shutdowns due to inactivity you'll lose the environment variables that the Terraform plans expect.

After a minute or two the Codespace devcontainer will be running, next we'll fork the repository to save our environment.

The quickest way I figured out how to achieve this process:

1. Open the Source Control panel
2. Force a push.
![Push](files/sourcecontrol.png)
3. Shutdown the Codespace.
![Shutdown](files/command_palette.png)
4. Wait for the Codespace window to show a button to "Restart codespace".
5. Select "Restart codespace".
6. Verify the Codespace is using the fork under your account: In a Codespace shell run `echo $GITHUB_REPOSITORY`. It should print _**your_username/cloud-networking-101**_.

**Congratulations!**

You now have a Codespace devcontainer that uses the prebuilt image, will save changes to your fork, and use your Codespace Secrets for environment variables. Most importantly when the Codespace shutdown and restarts you won't lose the configuration, setup or Terraform local state. Make sure not to delete the Codespace until you are sure you no longer want to play around with the lab. From here on out stopping and starting the Codespace _should_ be fine.

---

## :rocket: [Take me to Lab 3](lab3.md)
