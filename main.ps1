
# Set your source folder path
$files = Get-ChildItem -Path "D:\Projects\File-Movement"
foreach ($file in $files) {

    # Set your destination folder path
    $destinationRoot = "D:\Projects\Moved"

    # Initial creation date and modified date both are added based on your requirement you can comment out one line
    $destinationFolder = $destinationRoot + "\" + $file.CreationTime.ToString("yyyy-MM-dd")
    # $destinationFolder = $destinationRoot + "\" + $file.LastWriteTime.ToString("yyyy-MM-dd")

    if (-not (Test-Path -Path $destinationFolder -PathType Container)) {
        New-Item -ItemType Directory -Path $destinationFolder | Out-Null
        Write-Output "Created folder: $destinationFolder"
    }
    
    # If you are running this script from the same folder, then skip the main.ps1 file
    if($file.Name -eq "main.ps1") {
        continue        
    }
    
    # Copy and move both lines are added here, based your requirement you can comment out one line
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destinationPath
    # Copy-Item -Path $file.FullName -Destination $destinationPath
    Write-Output "Moved file: $($file.Name) to $destinationFolder"
}
