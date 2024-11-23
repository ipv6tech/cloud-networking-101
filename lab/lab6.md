# Lab 6: Testing and verifying routing

## Objective

Verify that BGP is active and routes are exchanging between peers.

## Verify with Insight Console

There are two primary places we should check inside Insight Console to verify that our dedicated connections have established BGP states and hopefully are exchanging some routes.

The first place to look in the console is in our VNS. Each of the connections will eventually show BGP state "up" and traffic graphs.

The better place to verify routing is by using the Insight Console Looking Glass tool.

Using the command `show bgp vrf VNROUTER-NNXXX` against the correct Internet2 router will show the BGP prefixes in the routing table on that router.

### Verify with Looking Glass

1. From the Virtual Network Space note or copy the VRF ID in the left sidebar for the Virtual Router.
2. On the Virtual Router note the physical device one of the connections uses (e.g., agg1.ashb).
3. Navigate to Insight Console Looking Glass
4. Select the Internet2 router that one of connections uses (e.g., agg1.ashb).
5. Type `show bgp vrf <paste_VRF_ID>`
6. Press `Run`.
7. 

## :rocket: [Take me to Lab 7](lab7.md)
