
# Multicloud Networking 101

**_Networking to and inside the Cloud Service Providers_**

[![Codespaces Prebuilds](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds/badge.svg)](https://github.com/ipv6tech/cloud-networking-101/actions/workflows/codespaces/create_codespaces_prebuilds)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/cloud-networking-101)

> [!CAUTION] Work in Progress
> **_The slides and labs are a work in progress and not complete yet_**

## Abstract

This full day workshop will lead you through a deep dive into cloud networking. As a participant, you will leave this workshop with knowledge of the necessary networking components required to operate a functional cloud environment with dedicated cloud connectivity. The workshop combines lectures with labs to provide hands-on experience with the course concepts.

## Workshop Outline

This full day workshop combine lecture with hands-on labs.

Some of the things you will learn during the workshop include

- Overview and benefits of Internet2’s Cloud Connect service
- Use of Internet2’s [Insight Console](https://console.internet2.edu) used to build dedicated connections to the Cloud Service Providers (CSP's)
- Networking components supporting dedicated connectivity for each of the Cloud Service Providers.
- Establish dedicated connectivity and route traffic between multiple clouds.

It's helpful if you have some prior experience with _GNU/Linux_, [_Git_](https://gitimmersion.com/), _Github_, [_Terraform_](https://developer.hashicorp.com/terraform/tutorials), and _Cloud Technology_ but it's not a requirement to learn and have fun with the labs.

**Morning** 08:00 - 11:30

> - Gather and Introductions (30 minutes)
> - Lesson: Overview of Internet2 Cloud Connect (20 minutes)
> - Lesson: Introduction to Insight Console (20 minutes)
> - Lab 1: Using Insight Console (10 minutes)
> - Lesson: Insight Console use cases (10 minutes)

**Break** 09:30 - 10:00

> - Lesson: Lab overview (15 minutes)
> - Lab 2: Setting up your lab environment (30 minutes)
> - Lesson: Networking in the Cloud(s) (45 minutes)

**Lunch** 11:30 - 13:00 _Included_ On-site

**Afternoon** 13:00 - 16:30

> - Lesson: Networking in the Cloud(s) continued...
> - Lab 3: 

**Break** 14:30-15:00

> - Lab: More labs
> - Close-out

## Slides

You can find the [slide deck for the lectures here](slides/cloud_networking_101-20241209.pptx)

## Multicloud Networking Labs

>[!NOTE]
> As long as you clean up and delete the resources you build the cloud costs will be minimal for this workshop.

### Lab Requirements

- Laptop with internet access.
- Access to Internet2's [Insight Console](https://console.internet2.edu/).
- [Github account](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github) with access to run Github Codespaces.
- An account with each of the Cloud Service Providers (CSPs) you wish to use with the labs. 

  - [AWS Free Tier](https://aws.amazon.com/free)
  - [Azure Free Services](https://azure.microsoft.com/en-us/pricing/free-services)
  - [Google Cloud Tier](https://cloud.google.com/free)
  - [Oracle Free Tier](https://www.oracle.com/cloud/free)

> [!TIP]
> Consider creating a free-tier account using an email alias address, masked email or use plus addressing like `<email>+aws-training@gmail.com` for each account.

> [!CAUTION]
> Make sure you use complex passwords for your accounts and enable MFA. You don't need folks mining crypto on your dime.

:rocket: [Take me to the labs!](lab/README.md)

---
### Further Learning

1. [Getting Started With AWS Cloud | Step-by-Step Guide](https://youtu.be/CjKhQoYeR4Q?si=FUzdPFAMcd8KxRsR)
2. [Azure Account Setup](https://youtu.be/ZYps6TmBkWk?si=zqWeeu1ab2tV7vui&t=60)
3. [Google Cloud Account Setup]
4. [Oracle Cloud Account Setup]

Other Resources:

- I can recommend Andrew Brown's course over at [ExamPro](Exampro.co). Andrew has many free courses with short video that can help **git** you up to speed quickly.

## TODO

- [ ] [Maybe] Breakout slides for each lesson
- [ ] Export slide deck to PDF
- [ ] Finish Lab breakouts
- [ ] Better Lab documentation
- [ ] Lab solution branches
- [ ] IPv6 addressing
