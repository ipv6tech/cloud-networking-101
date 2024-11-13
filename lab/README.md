# Let's Get started

The labs leverage GitHub Codespaces with Terraform plans to build out basic environments for each CSP so we aren't spending out time together doing click-ops provision of a base environment. Specifically we will leverage GitHub Codespaces with a prebuilt, custom devcontainer, in the US-East region, to avoid spending time installing tools and configuring stuff on your laptop.

[Lab 1: Internet2 Insight Console](lab1.md)

[Lab 2: Using GitHub Codespaces](lab2.md)

- Starting a new Codespace
- Setting up the lab environment
  - Setting secrets and environment variables
  - Authenticating CLI tools with each CSP

[Lab 3: Terraform deployment of CSP Lab environments](lab3.md)

[Lab 4: Building Dedicated Connections to the Cloud](lab4.md)

[Lab 5: Establish Routing](lab5.md)

[Lab 6: Verifying Routing and testing](lab6.md)

[Lab 7: Cleaning up (avoiding large bills)](lab7.md)

We will focus the lab work on playing with the networking components, configuring routing, and testing/verifying the connectivity we build in this lab.



> [!NOTE]
> In order to try to keep our environments secure we will use codespaces secrets for private 

> [!WARNING]
> This repo uses a `.gitignore` file to try to keep Avoid committing your terraform state and terraform   

> [!NOTE]
> This lab will have you make modifications to the code in the repository in order to stand up your cloud environment(s). If you wish to save those modification you can commit those modifications and codespaces will fork the original repository under your account and save your modifications as a new commit.
