$plugins = Get-ChildItem $PSScriptRoot\Sources
foreach($plug in $plugins) {
    Write-Host -ForegroundColor Green "Deploying $($plug.name)"
    robocopy "$PSScriptRoot\sources\$($plug.name)" "$env:APPDATA\Elgato\StreamDeck\Plugins\$($plug.name)" /mir | Out-Null
}
Write-Host -ForegroundColor blue "Bouncing StreamDeck instance"
$StreamDeckProcess = get-process streamdeck 
$SDPath = $StreamDeckProcess.Path
$StreamDeckProcess | stop-process
start-process $SDPath
