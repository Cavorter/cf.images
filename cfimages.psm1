$script:urlTemplate = 'https://api.cloudflare.com/client/v4/accounts/{0}/images/v1'

$fileList = Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 -Exclude *.Tests.*

foreach ( $file in $fileList ) {
    . $file.FullName
}
