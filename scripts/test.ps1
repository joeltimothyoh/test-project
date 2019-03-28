begin {
    $projectUrl = 'https://github.com/joeltimothyoh/Get-StorageReport.git'
    $projectName = [System.IO.Path]::GetFileNameWithoutExtension($projectUrl)
}process {
    try {
        # Clone project
        git clone "$projectUrl"; if ($LASTEXITCODE) { throw }
        Push-Location "$projectName"
        Get-ChildItem -Force | Format-Table
        # Test project
        Import-Module "./Modules/$($projectName)/Get-SMARTReport.psm1"
        Get-StorageReport
        
    }catch {
        throw
    }
}
