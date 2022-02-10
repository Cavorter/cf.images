BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Test-ApiToken" {
    It "Returns expected output" {
        Test-ApiToken | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
