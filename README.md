# DIY-RubberDucky-Scripts
Collection of Powershell scripts to use with my DIY Rubber Duckies

* PowershellPayload.ino
  * Uploaded to Digikey device
  * Just switch the number in line 16 to the payload desired
* TrinkeyQuadPayload.ino
  * Uploaded to Adafruit Neo Trinkey
  * Able to send four payloads from one device
  * Payloads sent by either long pressing or short pressing each capacitive touch sensor
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
  * Copies all saved SSIDs and their passwords to a .txt file and then sends the file through a Discord webhook
  * Cleans up any traces afterwards
