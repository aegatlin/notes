# Networking

`nmap` and `net-tools` contain a collection of tools and functionality to let you explore your network.

## Network Scan

1. `ifconfig` will tell you your IP address and your subnet.
2. `sudo nmap -sn [CIDR]` will tell you the other devices on your network, their IP address, and other details when available.
   - -sn : "Ping Scan - disable port scan". This speeds up the request by disabling per-discovered-device port scanning, which can take a while.
   - CIDR : Classless Inter-Domain Routing. [See Wiki](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing). It specifies a range of network ports to scan over.
   - An example: `sudo nmap -sn 192.168.107.0/24`, will scan `192.168.107.0-255`.
3. For a scan with additional information per discovered device, run `sudo nmap -A -T4 CIDR`
   - -A : "Enable OS detection, version detection, script scanning, and traceroute"
   - -T : "Set timing template \(higher is faster\)"

## Port Scan

1. `sudo nmap [IP Address]`
   - [nmap port scanning tutorial](https://nmap.org/book/port-scanning-tutorial.html)
   - It will, among othe things, scan the 1000 most popular ports and report back whether or not they are open, and which services are available/listening on those ports.

### Common Ports and Services

- :22/tcp - ssh. Allows remote connection.
- :23/tcp - telnet. It's its own thing :D.
- :53/tcp - domain. DNS server. Routers will commonly open this port.
- :80/tcp - http. Any web browser can display comms.
- :554/tcp - rtsp. Real Time Streaming Protocol. E.g., used by IP cameras for streaming videos. VLC video player can display RTSP streams.
- :9010/tcp - sdr. Software Defined Radio? I see it on IP video cameras.
