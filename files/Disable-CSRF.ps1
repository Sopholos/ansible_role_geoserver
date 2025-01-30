#!/snap/bin/powershell -Command
# Ansible managed

param(
    [parameter(Mandatory=$true)][string]$path
)

$ErrorActionPreference = "Stop"

$text = Get-Content $path | Out-String

$disable = @'
<context-param>
      <param-name>GEOSERVER_CSRF_DISABLED</param-name>
      <param-value>true</param-value>
    </context-param>

    
'@

$found = $text.IndexOf($disable)

if ($found -lt 0) {
    $index = $text.IndexOf("<context-param>", 0)

    $text = $text.Insert($index, $disable)

    Write-Host $text
    Set-Content -Path $path -Value ($text.Trim())
}
