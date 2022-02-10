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
        [string]$FilePath,

        [Parameter(Mandatory = $false)]
        [switch]$RequireSignedUrls,

        [Parameter(Mandatory = $false)]
        [hashtable]$Metadata
    )

    Begin {
        $invokeParams = @{
            Method         = "Post"
            Uri            = ( [uri]( $script:urlTemplate -f $AccountId ) ).AbsoluteUri
            Authentication = "Bearer"
            Token          = $Token
            Form           = @{
                file = Get-Item -Path $FilePath
            }
        }

        if ( $RequireSignedUrls ) {
            $invokeParams.Form.requireSignedURLs = $true
        }

        if ( $Metadata ) {
            $invokeParams.Form.metadata = $Metadata
        }
    }

    Process {
        # $invokeParams | Write-Output
        $response = Invoke-RestMethod @invokeParams
        $response | Write-Output
    }
}
