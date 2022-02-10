BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Get-ImageList" {
    It "Returns expected output" {
        Get-ImageList | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
