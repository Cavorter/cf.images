BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Remove-Image" {
    It "Returns expected output" {
        Remove-Image | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
