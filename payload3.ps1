$o=New-Object -ComObject WScript.Shell;$o.SendKeys('%{ESC}');saps https://fakeupdate.net/win10ue/;sleep 1;$o.SendKeys('{F11}');sleep 10;$o.SendKeys('{ENTER}')
