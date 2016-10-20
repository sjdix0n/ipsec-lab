IPSEC LAB

3  x Customer CPE's
	- SRX site1
	- IOS site2 
	- VyOS site3

All 3 have a VM behind them labled as the site name for testing IPSEC connectivity betweent all 3 sites 

Clone repo.

Use Vagrant up to start up site1 and site3, for site2 you will need to create a IOS XE image from a licnensed source. 

this builds setup with no VPN config, you can either build one yourself, or if you feel like cheeting run the ansible playbook called playbook.yml.
