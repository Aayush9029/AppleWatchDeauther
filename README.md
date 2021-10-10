# AppleWatchDeauther
Unofficial  Apple Watch app for  esp8266_deauther.

WIP for an Apple watch app for https://github.com/SpacehuhnTech/esp8266_deauther

![Screen Shot 2021-10-09 at 10 26 10 PM](https://user-images.githubusercontent.com/43297314/136679025-9ef82c2c-b652-4467-92be-35c642bc54a6.png) ![Screen Shot 2021-10-09 at 10 25 35 PM](https://user-images.githubusercontent.com/43297314/136679017-f4b09c69-b321-4e0d-834f-3f5ebc35a1e8.png)

*Note: The bg color correlates to RSSI*


---

> The app violates Apples App store TOS (probably),so unless AltStore finds a way to sideload apple watch app you'll have to compile this for yourself.


Research: 

1. As of v2, the deauther seems to store data in [web interface directory](https://github.com/SpacehuhnTech/esp8266_deauther/tree/v2/web_interface)
  - 192.168.4.1/ssids.json
      - List of ssids *beacon attack seems to replicate ssids contained here*
  - 192.168.4.1/scan.json
      - List of all ssids scanned, their signal strength, security type and BSSID
  - 192.168.4.1/names.json
      - Saved Devices in Scan.html page, tapping add on scanned wifi adds the data here 
  - 192.168.4.1/attack.json
      - `[[false,0,0,0],[true,0,0,0],[false,0,0,0]]` can be translated to
      -  [[deauth = false], [Targets = 0], [pkt/s = 0/s]], [[beacon = false], [Targets = 0], [pkt/s = 0/s]], [[probe = false], [Targets = 0], [pkt/s = 0/s]]
  - [attack.js](https://github.com/SpacehuhnTech/esp8266_deauther/blob/v2/web_interface/js/attack.js#L4)
      - contains endpoints server has `run?cmd=attack`   
  - [scan.js](https://github.com/SpacehuhnTech/esp8266_deauther/blob/v2/web_interface/js/scan.js)
      ```js
     var cmdStr = "scan "
		 (type == 0 ? "aps " : "stations -t " + getE("scanTime").value + "s")
		 " -ch " + getE("ch").options[getE("ch").selectedIndex].value;
		 ```
  - [ssids.js](https://github.com/SpacehuhnTech/esp8266_deauther/blob/bbe1b24e304853b1292a6eaa84a83a1b84ac0998/web_interface/js/ssids.js)
      ```js
      //disabling random
      getFile("run?cmd=disable random", function () {
        load();
      });
      // enabling random 
        getFile("run?cmd=enable random " + getE("interval").value, function () {
          load();
        });
     ```
     
     
*Made with  🖤 for fun*

