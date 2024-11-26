# Lab 8: Close-out / Clean up

This Lab will walk you through the steps required to remove the connections and resources in each of the Cloud providers so you aren't getting billed after the workshop.

> [!IMPORTANT]
> Ask if you need help! This is important so that you aren't getting billed.

---

## AWS Clean-up

### Step1: AWS Console

1. Begin by Dissociating the Direct Connect Gateway from the Transit Gateway.
2. Delete the tvif connection from the DXGW.
3. Delete the DX Connection from the AWS Console

### Step 2: Insight Console

1. Delete the DX Connection from your Virtual Router.

### Step 3. Terraform Clean-up

1. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/aws`.
2. Next run `terraform destroy`.
3. Type `yes` at the prompt to proceed.

---

## Azure Clean-up

### Step 1: Azure Console

1. In the VNG connection settings delete the connection to the ER.
2. Next delete the ER peering toward the Internet2 virtual router.
3. Delete the ER connection toward Internet2.

### Step 2: Internet Insight Console

1. Delete the connection toward Azure.

### Step 3. Terraform Clean-up Azure

1. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/azure`.
2. Next run `terraform destroy`.
3. Type `yes` at the prompt to proceed.

---

## Google Cloud Clean-up

### Deprovision Google Cloud

1. In the Google Cloud Console Navigate to the Partner Interconnect service delete the connection to Internet2 Virtual Networks.
2. From the Internet2 Virtual Router delete the Partner Interconnect.
3. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/google`.
4. Next run `terraform destroy`.
5. Type `yes` at the prompt to proceed.

---

## Oracle Cloud Clean-up

### Deprovision Oracle Cloud

1. In the Oracle Cloud Console navigate to the Fast Connect Service.
2. Delete the FastConnect connection toward Internet2 Insight Console.
3. From the Virtual Router in Insight Console delete the FastConnect peering.
4. In the Codespace shell run `cd $CODESPACE_VSCODE_FOLDER/lab/oracle`.
5. Next run `terraform destroy`.
6. Type `yes` at the prompt to proceed.

---

## GitHub Cleanup

This is an optional item, if you don't use GitHub Codespaces for other stuff leaving the Codespace Instance in a stopped state shouldn't use more than the allocated free service hours and storage for any given month.

If you wish you can clean this up by simply deleting the GitHub Codespace instance from your account.

You can optionally also delete the [GitHub Codespace Secrets](https://github.com/settings/codespaces) that we set in Lab 3.

---

Thanks for attending the workshop, I hope you got something out of the workshop and are more comfortable creating dedicated connections with Internet2 Cloud Connect and using Insight Console and Internet2 Virtual Networks with the Cloud Connect partners.

If you found this valuable and would like to see similar workshops in the future please let us know.
