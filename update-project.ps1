$originalDir = Get-Location
$allSuccess = 0

# Check if src directory exists
if (-not (Test-Path -Path "./src" -PathType Container)) {
    Write-Error "Error: src directory not found."
    exit 1
}

# Get all project directories
$directories = Get-ChildItem -Path "./src" -Directory
if ($directories.Count -eq 0) {
    Write-Host "No project directories found in src."
    exit 1
}

# Process each project directory
foreach ($dir in $directories) {
    Write-Host "Processing $($dir.FullName)"
    
    # Enter directory
    try {
        Push-Location $dir.FullName -ErrorAction Stop
    }
    catch {
        Write-Error "  Error: Failed to enter directory"
        $allSuccess = 1
        continue
    }
    
    # Git fetch
    git fetch
    if ($LASTEXITCODE -ne 0) {
        Write-Error "  Error: git fetch failed"
        $allSuccess = 1
        Pop-Location
        continue
    }
    
    # Checkout develop branch
    git checkout develop
    if ($LASTEXITCODE -ne 0) {
        Write-Error "  Error: checkout develop failed"
        $allSuccess = 1
        Pop-Location
        continue
    }
    
    # Pull latest changes
    git pull
    if ($LASTEXITCODE -ne 0) {
        Write-Error "  Error: git pull failed"
        $allSuccess = 1
        Pop-Location
        continue
    }
    
    # Return to original directory
    Pop-Location
}

# Final status report
if ($allSuccess -eq 0) {
    Write-Host "All repositories updated and pulled successfully."
}
else {
    Write-Host "Some repositories encountered errors during update."
}

exit $allSuccess