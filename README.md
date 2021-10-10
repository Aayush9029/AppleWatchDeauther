# AppleWatchDeauther
Unofficial  Apple Watch app for  esp8266_deauther.

WIP for an Apple watch app for https://github.com/SpacehuhnTech/esp8266_deauther

![Screen Shot 2021-10-10 at 12 35 12 AM](https://user-images.githubusercontent.com/43297314/136682323-8e9dbaaa-9eba-4d50-af63-cf4b521af8d8.png) ![Screen Shot 2021-10-10 at 12 35 35 AM](https://user-images.githubusercontent.com/43297314/136682324-a7c14df4-a7fc-4f69-9127-230a8707b7d0.png) ![Screen Shot 2021-10-10 at 12 35 46 AM](https://user-images.githubusercontent.com/43297314/136682326-c1c1c646-4da0-4fdf-88dc-642eaf7eb9b2.png) ![Screen Shot 2021-10-10 at 12 35 54 AM](https://user-images.githubusercontent.com/43297314/136682328-b7e7c83b-0b70-4096-9a92-169fb10a6506.png) ![Screen Shot 2021-10-09 at 11 46 00 PM](https://user-images.githubusercontent.com/43297314/136682330-f8c32896-1a63-4e8c-987b-d02841c3e7af.png)

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

