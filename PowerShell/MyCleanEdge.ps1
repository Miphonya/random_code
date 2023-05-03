Remove-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Edge" -Recurse

$edge = Get-Process -Name msedge -ErrorAction SilentlyContinue
if ($edge) {
    Stop-Process -Name msedge
    Start-Process msedge
}