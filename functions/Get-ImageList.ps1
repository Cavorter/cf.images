function Get-ImageList {
    [CmdletBinding()]
    Param(
        [string]$AccountId,

        [securestring]$Token
    )

    [uri]$uri = $script:urlTemplate -f $AccountId
    $response = Invoke-RestMethod -Method Get -Uri $uri.AbsoluteUri -Authentication Bearer -Token $Token
    $response.result.images | Write-Output
}
