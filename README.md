# AppleWatchDeauther
Unofficial  Apple Watch app for  esp8266_deauther.

WIP for an Apple watch app for https://github.com/SpacehuhnTech/esp8266_deauther

*Made for fun*

> The app violates Apples App store TOS (probably),so unless AltStore finds a way to sideload apple watch app you'll have to compile this for yourself.


Research: 

1. As of v2, the deauther seems to store data in [web interface directory](https://github.com/SpacehuhnTech/esp8266_deauther/tree/v2/web_interface)
  - 192.168.4.1/attack.json
  - 192.168.4.1/ssids.json
      - List of ssids *beacon attack seems to replicate ssids contained here*
  - 192.168.4.1/scan.json
      - List of all ssids scanned, their signal strength, security type and BSSID
  - 192.168.4.1/names.json
      - Saved Devices in Scan.html page, tapping add on scanned wifi adds the data here 
  - 192.168.4.1/attack.json
      - `[[false,0,0,0],[true,0,0,0],[false,0,0,0]]` can be translated to
      -  [[deauth = false], [Targets = 0], [pkt/s = 0/s]], [[beacon = false], [Targets = 0], [pkt/s = 0/s]], [[probe = false], [Targets = 0], [pkt/s = 0/s]]
