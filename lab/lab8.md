# Lab 8: Close-out / Clean up

This Lab will walk you through the steps required to remove the connections and resources we built with each provider so you aren't accruing costs after the workshop.

> [!IMPORTANT]
> Ask if you need help! This is important so that you aren't getting billed.

## Table of Contents

- [AWS Clean-up](#aws-clean-up)
- [Azure Clean-up](#azure-clean-up)
- [Google Cloud Clean-up](#google-cloud-clean-up)
- [Oracle Cloud Clean-up](#oracle-cloud-clean-up)
- [Insight Console Clean-up](#insight-console-clean-up)
- [GitHub Clean-up](#github-clean-up)

---

## AWS Clean-up

### Step1: AWS Console manual resource clean-up

We will begin by disassociating the Direct Connect Gateway from the Transit gateway.

1. Navigate to the [Direct Connect](https://us-east-1.console.aws.amazon.com/directconnect/v2/home?region=us-east-1#/) service.
2. Select **Transit gateways** from the left menu.
3. Select the **`tgw_i2lab`** gateway.
4. Press **View Details**.
5. Under the **Direct Connect gateway associations** select the association.
6. Press **Disassociate**.

This process can take quite some time to finish

### Step 2: Delete the virtual interface

Next we need to delete the virtual interface toward the Internet2 virtual router.

1. In the Direct Connect service find the **Virtual interfaces** under the left menubar.
2. Select the VIF toward Internet2.
3. Press **`Delete`**.

### Step 3: Delete Direct Connect peering from Insight Console

1. Navigate to the Virtual Network Space.
2. Find the Virtual Router and AWS Direct Connect connection(s).
3. Press **`Details`** on the Peering.
4. Press the hamburger icon in the upper right hand corner of the details window.
5. Press **`Delete Peering`**.

> [!NOTE]
> The VIF deletion can take quite some time to fully delete and the peering will remain in the Insight Console until the VIF is fully deleted on the AWS side.
>
> Eventually this will finish and this workflow should cause the Direct Connect Connection to delete from the AWS Console.

### Step 4: Terraform Clean-up

1. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/aws`.
2. Next run `terraform destroy`.
3. Type `yes` at the prompt to proceed.

>[!NOTE]
This will take around 5 minutes to complete.

At this point you should have seen a successful message similar to **`Destroy Complete! Resources: 14 destroyed.`**

> [!TIP]
> If you instead receive an error, check the error message and see which resource the terraform destroy process got hung up on. Sometimes you might have missed deleting a resource we added manually and will need to go into the Console and remove that resource. Other times you might just need to run the terraform destroy process again after a short wait. If you are stuck here, grab one of the instructors.

---

## Azure Clean-up

### Step 1: Azure Console

1. In the Azure Console search bar search for **virtual network gateways**.
2. Click on the **`i2lab-vng`** gateway.
3. Under the Settings section of the menu select **Connections**.
4. Click on the VNG connection to the ExpressRoute connection.
5. Press **`Delete`**.

### Step 2: Delete ExpressRoute Connection(s) from Insight Console

1. Navigate to the Virtual Network Space.
2. Find the Virtual Router and ExpressRoute connection(s).
3. Press **`Details`** on the Peering.
4. Press the hamburger icon in the upper right hand corner of the details window.
5. Press **`Delete Peering`**.

### Step 3. Terraform Clean-up Azure

1. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/azure`.
2. Next run `terraform destroy`.
3. Type `yes` at the prompt to proceed.

>[!NOTE]
This will take about 10-15 minutes to complete.

At this point you should have seen a successful message similar to **`Destroy Complete! Resources: 16 destroyed.`**

> [!TIP]
> If you instead receive an error, check the error message and see which resource the terraform destroy process got hung up on. Sometimes you might have missed deleting a resource we added manually and will need to go into the Console and remove that resource. Other times you might just need to run the terraform destroy process again after a short wait. If you are stuck here, grab one of the instructors.

### Step 4: Delete ExpressRoute Connection from Azure

1. Browse [all resource](https://portal.azure.com/#browse/all) to see what is left in the Azure Portal
2. Select the ExpressRoute Circuit
3. Press **`Delete`**.
4. Remove any other resources that aren't needed.

---

## Google Cloud Clean-up

### Step 1: Delete Partner Interconnect from Insight Console

1. Navigate to the Virtual Network Space.
2. Find the Virtual Router and Google Cloud connection.
3. Press **`Details`** on the Peering.
4. Press the hamburger icon in the upper right hand corner of the details window.
5. Press **`Delete Peering`**.

### Step 2: Delete Google Partner Interconnect VLAN attachment

1. Navigate to Network Connectivity>Interconnect>VLAN attachments.
2. Select the VLAN attachment to the I2 virtual network.
3. Press **`Delete`**.

### Step 3: Terraform destroy the Google Cloud i2lab environment

1. In the Google Cloud Console Navigate to the Partner Interconnect service delete the connection to Internet2 Virtual Networks.
2. From the Internet2 Virtual Router delete the Partner Interconnect.
3. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/google`.
4. Next run `terraform destroy`.
5. Type `yes` at the prompt to proceed.

>[!NOTE]
>This will take about 2-3 minutes to complete.

At this point you should have seen a successful message similar to **`Destroy Complete! Resources: 7 destroyed.`**

> [!TIP]
> If you instead receive an error, check the error message and see which resource the terraform destroy process got hung up on. Sometimes you might have missed deleting a resource we added manually and will need to go into the Console and remove that resource. Other times you might just need to run the terraform destroy process again after a short wait. If you are stuck here, grab one of the instructors.

### Step 4: _(Optional)_ Remove the workshop project

1. From the Codespaces shell run **`gcloud projects delete $TF_VAR_GC_PROJECT_ID`**.

---

## Oracle Cloud Clean-up

### Step 1: Delete FastConnect peer from Insight Console

1. Navigate to the Virtual Network Space.
2. Find the Virtual Router and Oracle FastConnect connection.
3. Press **`Details`** on the Peering.
4. Press the hamburger icon in the upper right hand corner of the details window.
5. Press **`Delete Peering`**.

### Step 2: Terraform destroy the Oracle Cloud i2lab environment

1. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/oracle`.
2. Next run `terraform destroy`.
3. Type `yes` at the prompt to proceed.

>[!NOTE]
>This will take about 5-8 minutes to complete.

At this point you should have seen a successful message similar to **`Destroy Complete! Resources: 12 destroyed.`**

> [!TIP]
> If you instead receive an error, check the error message and see which resource the terraform destroy process got hung up on. Sometimes you might have missed deleting a resource we added manually and will need to go into the Console and remove that resource. Other times you might just need to run the terraform destroy process again after a short wait. If you are stuck here, grab one of the instructors.

---

## Insight Console Clean-up

Don't forget to delete your Insight Console Resources.

1. Virtual Router
2. Virtual Network Space

If you wish to keep a VNS and router to play with that is fine. Periodically the training organizations and virtual networks spaces will be cleaned out. You are also welcome to create a sub organization under your organization or regional partner for a test environment. If you need help gaining access to an organization that has permissions to create resources, [please reach out to us here](https://noc.net.internet2.edu/help).

---

## GitHub Clean-up

There are a few places to consider cleaning up in GitHub.

- [**GitHub Codespace Secrets**](https://github.com/settings/codespaces) _(used for environment variables)_
  - There are a limit to how many Codespace secrets you can have in your account and likely the tokens will go stale. Of all the GitHub clean-up this is the one that probably makes the most sense to do. Especially if you don't plan to do the labs in the future.

Copy and paste these into the Codespaces Terminal before deleting your Codespace instance to remove all the secrets we created during the labs.

```bash
gh secret delete TF_VAR_EMAIL -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_ENV -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_AZ_SUBSCRIPTION_ID -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_GC_PROJECT_ID -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_OCI_COMPARTMENT -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_OCI_FINGERPRINT -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_OCI_USER -u -R $GITHUB_REPOSITORY
gh secret delete TF_VAR_OCI_TENANCY -u -R $GITHUB_REPOSITORY
```

- **The fork of the Cloud Networking 101 repository**
  - If you'd like to keep the fork of the repository feel free, if you have improvements feel free to do a PR and if we can use the improvements in a future workshop we will. Otherwise feel free to delete the fork from your account.

- [**GitHub Codespaces instance**](https://github.com/codespaces)
  - You can safely, manually, delete the Codespaces instances after you've finished your **`terraform destroy`** for each provider. Or just leave the instance unused for 30 days and it will self delete. You can always launch a new codespace from the original repository or from your fork of the repository in the future.

---

## Thank you

Thank you for attending the workshop :exclamation: :pray:

I hope you learned something new from the workshop and are more comfortable creating dedicated connections with [Internet2 Cloud Connect](https://internet2.edu/services/cloud-connect/) and using [Insight Console](https://console.internet2.edu) and Internet2 Virtual Networks with the Cloud Connect partners.

Keep a look out for other opportunities for training at the [Internet2 CLASS website](https://internet2.edu/cloud/cloud-learning-and-skills-sessions/).

If you found the workshop valuable and would like to see similar workshops in the future please let us know!