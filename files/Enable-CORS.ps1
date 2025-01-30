#!/snap/bin/powershell -Command
# Ansible managed

param(
    [parameter(Mandatory=$true)][string]$path
)

$ErrorActionPreference = "Stop"

function Remove-Comment($text, $startComment, $endComment) {
    $startIndex = $text.IndexOf($startComment)
    if ($startIndex -lt 0) { return $text; }

    $endIndex = $text.IndexOf($endComment, $startIndex + $startComment.Length)
    if ($endIndex -lt 0) { return $text; }

    $text = $text.Remove($endIndex, $endComment.Length)
    $text = $text.Remove($startIndex, $startComment.Length)
    return $text;
}

$text = Get-Content $path | Out-String

# changed coment way in new geoserver (2.25.3 at least)

$text = Remove-Comment `
    $text `
    "<!-- Uncomment following filter to enable CORS in Jetty. Do not forget the second config block further down. -->`n    <!--" `
    "-->"

$text = Remove-Comment `
    $text `
    "<!-- Uncomment following filter to enable CORS in Jetty. Do not forget the second config block further down." `
    "-->"

$text = Remove-Comment `
    $text `
    "<!-- Uncomment following filter-mapping to enable CORS -->`n    <!--" `
    "-->"

$text = Remove-Comment `
    $text `
    "<!-- Uncomment following filter to enable CORS`n" `
    "-->"

Set-Content -Path $path -Value ($text.Trim())
