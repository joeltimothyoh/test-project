begin {
    $projectUrl = 'https://github.com/joeltimothyoh/Remove-iCloudPhotosShortcut.git'
    $projectName = [System.IO.Path]::GetFileNameWithoutExtension($projectUrl)
}process {
    try {
        # Clone project
        git clone "$projectUrl"; if ($LASTEXITCODE) { throw }
        Push-Location "$projectName"
        Get-ChildItem -Force | Format-Table
        # Test project
        git checkout dev
        ./Remove-iCloudPhotosShortcut.ps1
    }catch {
        throw
    }
}
