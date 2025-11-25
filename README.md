# Multicloud Networking 101

**_Networking to and inside the Cloud Service Providers_**

## Workshop Objectives

This half day workshop will guide participants through establishing multi-cloud connectivity using Internet2 Cloud Router. Participants will build and configure direct connections between two or more cloud service providers (CSPs) and verify routing functionality through Internet2's Cloud Connect service. By the end of this session, attendees will have practical experience with Internet2's Insight Console Virtual Networks feature and understand how to implement secure, high-performance multi-cloud networking solutions.

**By the end of this tutorial, participants will be able to:**

- Understand the concepts and benefits of multi-cloud networking
- Navigate Internet2's [Insight Console](https://console.internet2.edu) to manage cloud connectivity
- Configure Internet2 Cloud Router to connect multiple cloud service providers
- Set up routing between cloud environments
- Verify routing and connectivity between cloud providers
- Implement best practices for multi-cloud network management

**Audience:**

- IT professionals managing campus network infrastructure
- Research computing support staff
- Cloud administrators looking to optimize connectivity between cloud providers
- Network engineers interested in implementing multi-cloud solutions

**Prerequisites:**

- Basic understanding of networking concepts (IP addressing, routing)
- Familiarity with a couple major cloud providers (AWS, Azure, GCP, Oracle Cloud)

## Agenda

**Monday, December 8 2025:** 08:00 - 11:30

> - Gather and Introductions (10 minutes)
> - Lesson: Introduction to Insight Console (10 minutes)
> - Lesson: Lab overview (10 minutes)
> - [Lab 1: Internet2 Insight Console](lab/lab1.md) (10 minutes)
> - [Lab 2: Using GitHub Codespaces](lab/lab2.md) (15 minutes)
> - [Lab 3: Authenticating and Configure CLI tools](lab/lab3.md) (10 - 40 minutes)
>  
> **Break** (as needed)
> 
> - [Lab 4: Infrastructure as Code deployment of CSP lab environments](lab/lab4.md) (10 minutes)
> - [Lab 5: Building Dedicated Connections to the Cloud](lab/lab5.md) (60 minutes)
> - [Lab 6: Testing and verifying routing](lab/lab6.md) (20 minutes)
> - [Lab 7: Verifying Routing Tables with the CSPs _(time permitting)_](lab/lab7.md) (20 minutes)
> - [Lab 8: Cleaning up (avoiding large bills)](lab/lab8.md) (30 minutes)
> - Close-out
>
>**Lunch** 11:30 - 13:00
> (_Included_ On-site)

## Slides

You can find the [slide deck for the lectures here](slides/cloud_networking_101-20241209.pdf).

## Labs

>[!NOTE]
> As long as you clean up and delete the resources you build the cloud costs will be minimal for this workshop.

### Lab Requirements

It's helpful if you have some prior experience with _GNU/Linux_, [_Git_](https://gitimmersion.com/), [_GitHub_](https://docs.github.com/en/get-started), [_Terraform_](https://developer.hashicorp.com/terraform/tutorials), [_VS Code_](https://code.visualstudio.com/docs/getstarted/getting-started), and _Cloud Technology_ but it's not a prerequisite to learn and have fun with the labs.

- Laptop with internet access.
- Access to Internet2's [Insight Console](https://console.internet2.edu/).
- [GitHub account](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github) with access to run [GitHub Codespaces](https://github.com/codespaces).
- An account with each of the Cloud Service Providers (CSPs) you wish to use during the labs.

>[!TIP]
>I strongly recommend a personal **free tier account** so you don't run into policy/permission issues with a restricted account from your institution.
>
>Consider creating a free-tier account using an email alias address, masked email or use plus addressing like `<email>+aws-training@gmail.com` for each account.

>[!IMPORTANT]
>Free tier accounts will require a credit card but we will keep the costs to a minimum. In many cases the free services and credits your account will start with will cover some or all the costs. (With my accounts I've been able to run through the labs and keep the daily cost around 5 USD with each CSP.)

### Free Tier Services

As you build out your Free Tier accounts keep in mind that the infrastructure code for the Cloud Service Provider (lab) environments and the GitHub Codespaces are preconfigured to run in the US-East regions. If you are able to use those regions for this workshop it should simplify things.

> - [AWS Free Tier](https://aws.amazon.com/free)
> - [Azure Free Services](https://azure.microsoft.com/en-us/pricing/free-services)
> - [Google Cloud Tier](https://cloud.google.com/free)
> - [Oracle Free Tier](https://www.oracle.com/cloud/free)
>
> _If you need help getting the free tier accounts setup, see the [Further Learning](#further-learning) resources below._ :arrow_down:

## :rocket: [Take me to the labs!](lab/README.md)

---

### Further Learning

#### Free Tier Account Creation

1. [Getting Started With AWS Cloud | Step-by-Step Guide](https://youtu.be/CjKhQoYeR4Q?si=PVL5XOV25qWbA7Sb&t=104)
2. [Azure Account Setup](https://youtu.be/ZYps6TmBkWk?si=zqWeeu1ab2tV7vui&t=60)
3. [Google Cloud Account, Organization, Project Setup](https://youtu.be/qofqzJbqD3s?si=GSgZ4ngMp7ZOi9nh&t=108)
4. [Oracle Cloud Account Setup](https://www.youtube.com/watch?v=YnsN52hB8EY)

#### Terraform

1. [Terraform tutorials](https://developer.hashicorp.com/terraform/tutorials)

#### Git & GitHub

1. [Git Immersion](https://gitimmersion.com/)
2. [GitHub for Beginners](https://github.blog/tag/github-for-beginners/)
3. [GitHub Training with Andrew Brown](https://www.exampro.co/github-foundations) (_Free limited version of the course available_)

---

<details><summary><b>Future</b></summary>

- [ ] Rework code to update SSH config file when public IP changes
- [ ] Change base Dockerfile image to reduce size of prebuilt
- [ ] Further optimize Devcontainer environment
- [ ] Branches with IaC for Lab solutions?
- [ ] IPv6 addressing
- [ ] Refactor code to make it easier to switch regions
- [ ] Develop 2/3/400 level workshop that builds on this workshop

</details>
