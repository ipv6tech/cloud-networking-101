
# **Multicloud Networking 101:** _Networking to and inside the Cloud Service Providers_

## Abstract

The Internet2 Team (Scott Taylor and others) will lead participants through a deep dive into cloud networking. As a participant, you will leave this workshop with knowledge of the necessary networking components to operate a functional cloud environment with dedicated cloud connectivity.

During the first half of the workshop, we will cover the following topics:

- Overview and benefits of Internet2’s Cloud Connect service
- Tutorial on Internet2’s Insight Console used to build dedicated connections to the Cloud Service Providers
- Necessary networking components for each of the Cloud Service Providers.

The second half of the workshop will allow participants to get hands-on with their newly acquired knowledge and build connectivity to and inside the cloud service providers.

## Workshop Outline

This full day workshop will be split into two section, a lecture portion and a hands-on lab portion.

### First Half

1. Overview of Internet2 Cloud Connect
2. Introduction to Insight Console
   - Insight Console use cases
3. Networking in the Cloud(s)

### Second Half

1. Hands-on workshop building hybrid and multicloud connectivity

#### Requirements

> [!NOTE]
> Further requirements will be shared with participants ahead of the workshop.

- Laptop with Internet access
- Access to Internet2's [Insight Console](https://console.internet2.edu/)
- [Github account](https://github.com/) with access to Github Codespaces
- An account in each of the Cloud Service Providers (CSPs) you wish to use in the hands-on workshop. _(As long as you delete the resources we build the cloud costs will be minimal for this workshop.)_
  - [AWS Free Tier](https://aws.amazon.com/free)
  - [Azure Free Services](https://azure.microsoft.com/en-us/pricing/free-services)
  - [Google Cloud Tier](https://cloud.google.com/free)
  - [Oracle Free Tier](https://www.oracle.com/cloud/free)

> [!TIP]
> Consider creating a throw-away free-tier account using an email alias address like <email+aws-i2@gmail.com> or similar for each account.

## Detailed Course Outline

Compare Cloud Providers

Cloud Resource (Hierarchy Slide)

Understanding Regions, Zones (Comparison Slides)

Network components (comparison Slide)

Virtual Data Center

Google’s is a global resource - others are regional

Subnets (Public vs Private)

Google Subnet is a regional resource unlike the other CSP

## Let's Get started

Press the button below to get started with the lab

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ipv6tech/CloudNetworking101)

1. Accept the defaults and let the new Codespace spin up, it's based on this repo and has the all the packages we need installed for our lab.
2. 