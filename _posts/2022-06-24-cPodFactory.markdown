---
layout: post
title:  "Nested SDDC for Testing/Lab/Demo"
date:   2022-06-24 17:00:00 +0000
categories: vmware sdd vsphere ovh
---
dFactory is one of my projects during my VMware years. The main purpose is to automatically and dynamically create nested SDDC environments. It's means you with it the capability to create a separated but nested vSphere SDDC fully routed (dedicated L2 but L3 routed) configured and ready to use.

It comes with ``cpodctl`` command line giving you all necessary command to manage cPod lifecycle. A cPod is a lab or if you prefer the nested vSphere. You can:
1. Create a cPod: naked one (without esx but all networking facilities) or specifying number of esx
2. Delete a cPod entirely, caution - it's fast without roll back
3. Deploy & configure vCenter accordingly your cPod
4. List all cPods
5. Deploy VCF cloudbuilder if you want to transform cPod into VCF cluster(s)
6. Retrieve the auto generated cPod password
7. Override some variables to customize your cPod
8. Use completion in bash to facilitate life with tab key

cpodctl cli:
![cpodctl cli](/gfx/cpodfactory-cpodctl.png)

A large Availability Zone running physical layer by VCF:
![cpodctl cli](/gfx/cpodfactory-az-fkd.png)

cPodFactory also offers:
- Multi availability zones and connect them via wireguard: it's possible to move workload across different az or to connect services on different cPods
- DNS resolution for all az
- VPN for client with OpenVPN, Windows/Mac/Linux compatible
- DHCP for each L2 connectivity
- Dynamic L3 routing with BPG, with the possibility to peer NSX Edge in a cPod
- Nested NSX and nested VSAN

It needs for the physical layer:
- at least 2 or 3 esx 6.7 + vCenter or VCF with 4 esx
- vSAN for storage or any shared datastore (NFS, iSCSI, FC)
- VLAN backend network or NSX overlay (NSX is not mandatory at all)

I ran it for 4 years to help colleagues to have serious labs and also used it for all my customer workshops. We have never had severe issue of availability or performance - thanks to vSphere for its capabilities to run heavy workloads. It has been deployed in several country interconnected via wireguard: Paris(FR), OVH(FR), Madrid(SP), Munich(DE), Dubai(UAE).

To give you ideas of use cases:
- Large Proof Of Concept with Tanzu running Telco NVFs and consuming +480Gb in of memoryin kubernetes, 9 esx cPod 
- Demo cPod dedicated to vRealize Automation with NSX and vSAN connected with Public Cloud deploying hybrid App
- multi VCF cPods in different regions (Paris <-> Dubai) moving VM workloads via HCX
- Cloud Migration from cPod in OVH to VMC in AWS, moving VM via HCX, fully routed without application interruption, keeping on-prem DB
- All new vSphere 8 cPod with Tanzu Grid 2.0 for training purpose

This project is open source. You can use it, improve it but not in production. Nested is not supported/allowed for production.

[Check out git repo](https://github.com/bdereims/cPodFactory) - you find here all the necessary to install yours.

Enjoy!
