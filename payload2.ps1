$wshShell = new-object -com wscript.shell;1..50 | % {$wshShell.SendKeys([char]174)};1..50 | % {$wshShell.SendKeys([char]175)}
Function Speak-Text($Text) { Add-Type -AssemblyName System.speech; $TTS = New-Object System.Speech.Synthesis.SpeechSynthesizer; $TTS.Speak($Text) };
Speak-Text "bananananananananananananananana"
sleep 1;
Speak-Text "By the way you look great in your webcam kek w"
Exit
