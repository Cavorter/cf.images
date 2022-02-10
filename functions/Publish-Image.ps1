function Publish-Image {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$AccountId,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [securestring]$Token,

        [Parameter(Mandatory = $true)]
        [ValidateScript({ Test-Path -Path $_ })]
        [string]$FilePath
    )

    $invokeParams = @{
        Method = "Post"
        Uri = ( [uri]( $script:urlTemplate -f $AccountId ) ).AbsoluteUri
        Authentication = "Bearer"
        Token = $Token
        Form = @{
            file = $FilePath
        }
    }

    switch ( (Get-ChildItem -Path $FilePath).Extension ) {
        ('.jpg' -or '.jpeg') { $invokeParams.ContentType = 'image/jpeg' }
        '.png' { $invokeParams.ContentType = 'image/png' }
    }

    $invokeParams | Write-Output
    $response = Invoke-RestMethod @invokeParams
    # $response | Write-Output
}
