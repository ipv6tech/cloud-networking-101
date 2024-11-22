# Lab 1: Setup Internet2 Insight Console

## Objective

This lab use Internet2 Insight Console to build out an Internet2 Virtual/Cloud Router for Layer 3 connectivity between two or more connections across the Internet2 Network.

---

## Step 1: Signing in

Let's get signed in!

1. Proceed to the [Sign in](https://api.ns.internet2.edu/v1/sessions/login) link in the upper right hand corner of the [Insight Console](https://console.internet2.edu) homepage.
2. Select how you would like to sign in. _(Most Internet2 members will use  the `Access through your institution` option.)_
3. Authenticate with your credentials. This should redirect you back to [Insight Console](https://console.internet2.edu).

---

## Step 2: Create a new Virtual Network Space

This process creates a new Virtual Network Space (VNS) to which we will add a virtual router for our connections to the cloud. Think of the VNS as a private virtual compartment/project/network that you will use to place resources (i.e., Virtual Router, Virtual Switches) for building private networks across the Internet2 Network.

1. Using the `Services` menu in the upper left corner of the console, navigate to [Virtual Networks](https://console.internet2.edu/#/vn/list).
2. Press `New Space` in the upper right of the screen.
3. In the left sidebar of the new window, enter a title (e.g., `Scotts Lab Space`).
4. _(Optional)_ Add any notes about the space.
5. For the Owner select `techex_2024`. _(Hint: If you have a long list, `techex_2024` can be found at the bottom of the list.)_
6. Next select `Save`.

---

## Step 3: Create a Virtual Router

In this step we will add a new resource, a Virtual/Cloud Router to the VNS we created above.

1. In the left sidebar of your new VNS press `Add Virtual Router`.
2. _(Optional)_ Add any notes you'd like about the virtual router.
3. Press `Save`.

---

At this point the you've successfully created a Virtual Network Space and a Virtual/Cloud Router to support your private network. In the next Lab we will prepare our GitHub Codespaces for provisioning base cloud resources.

## :rocket: [Go to Lab 2](lab2.md)
