
$chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".ToCharArray()
$password = @()

$rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
$bytes = New-Object Byte[] 1

for ($i = 1; $i -le 18; $i++) {
    do {
        $rng.GetBytes($bytes)
        $index = $bytes[0]
    } while ($index -ge ($chars.Count - ($chars.Count % 1)))
    
    $password += $chars[$index % $chars.Count]
    
    if ($i -eq 6 -or $i -eq 12) {
        $password += '-'
    }
}

$result = -join $password
Write-Host "Your password:" -ForegroundColor Green
Write-Host $result -ForegroundColor Cyan
# Copying your password to clipboard
Set-Clipboard $result
Write-Host "(Your password copied to clipboard!)" -ForegroundColor DarkGray
Read-Host "Press enter to exit..."
