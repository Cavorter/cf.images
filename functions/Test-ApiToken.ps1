function Test-ApiToken {
    Param(
        [CmdletBinding()]
        [Parameter(Mandatory = $true)]
        [securestring]$Token
    )

    Process {
        $result = Invoke-RestMethod -Uri https://api.cloudflare.com/client/v4/user/tokens/verify -Authentication Bearer -Token $Token
        $result | Write-Output
    }
}
