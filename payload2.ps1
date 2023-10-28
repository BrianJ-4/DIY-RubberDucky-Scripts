Function Speak-Text($Text) { Add-Type -AssemblyName System.speech; $TTS = New-Object System.Speech.Synthesis.SpeechSynthesizer; $TTS.Speak($Text) };
Speak-Text "bananananananananananananananana"
sleep 1;
Speak-Text "By the way you look great in your webcam kek w"
Exit
