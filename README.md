# PowershellScripts
Collection of Powershell scripts to use with my Digispark rubber ducky

* PowershellPayload.ino
  * Uploaded to Digikey device
  * Just switch the number in line 16 to the payload desired
* Payload 1
  * Changes wallpaper of the target computer
* Payload 2
  * Sets volume to 100
  * Says a message out loud
* Payload 3
  * Displays fake Windows update screen
  * After ten seconds shows BSOD screen
* Payload 4
  * Combines Payloads 1 with the Youtube tripwire from I-Am-Jakoby
* Payload 5
  * Listens to the targets clipboard
  * Everytime a new item is copied the item is sent through a Discord webhook
* Payload 6
  * Originally was designed to extract all SSIDs and passwords and save them to a .txt file and send the file out but this did not work due to permission issues when creating a file with a powershell started from Run (Windows + R)
  * Now creates a string comprised of the targets saved networks and passwords and sends it out through a Discord webhook
