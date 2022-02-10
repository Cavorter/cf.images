BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Publish-Image" {
    It "Returns expected output" {
        Publish-Image | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
