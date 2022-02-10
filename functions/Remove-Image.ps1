function Remove-Image {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$AccountId,
    
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [securestring]$Token,
    
        [Parameter(Mandatory = $true)]
        [string]$Id
    )
    
    $invokeParams = @{
        Method         = "Delete"
        Uri            = ( [uri]( "$script:urlTemplate/$Id" -f $AccountId ) ).AbsoluteUri
        Authentication = "Bearer"
        Token          = $Token
        ContentType    = 'application/json'
    }
    
    
    $response = Invoke-RestMethod @invokeParams
    $response | Write-Output
}
    