# Path of the file whose creation date you want to modify
$filePath = "C:\path\to\your\file.txt"

# New creation date you want to set
$newCreationDate = Get-Date "2023-01-01 10:00:00"

# Check if the file exists
if (Test-Path $filePath) {
    # Get the file object
    $file = Get-Item $filePath
    
    # Modify the creation date
    $file.CreationTime = $newCreationDate
    
    Write-Output "The file's creation date has been successfully modified."
} else {
    Write-Output "The specified file does not exist."
}
