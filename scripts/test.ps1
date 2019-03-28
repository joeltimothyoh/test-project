begin {
    $projectUrl = 'https://github.com/namespace/projectname.git'
    $projectName = [System.IO.Path]::GetFileNameWithoutExtension($projectUrl)
}process {
    try {
        # Clone project
        git clone "$projectUrl"; if ($?) { throw }
        Push-Location "$projectName"
        Get-ChildItem -Force | Format-Table
        # Test project
    }catch {
        throw
    }
}