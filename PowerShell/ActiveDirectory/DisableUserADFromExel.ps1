# Import users from a CSV file
$users = Import-Csv -Path "C:\exemple\exemple.csv"

# Iterate through each user in the imported CSV data
foreach ($user in $users) {
    
    # Extract the "username" field from the current user
    $Username = $user."username"

    # Get the Active Directory user account based on the extracted username
    $UserToDisable = Get-ADUser -Identity $Username

    # Check if the user account exists in Active Directory
    if ($UserToDisable) {
        # If the user account exists, disable it
        Disable-ADAccount -Identity $UserToDisable
        # Output a message indicating that the user has been disabled
        Write-Host "User disabled: $Username"
    } else {
        # If the user account does not exist, output a message indicating it was not found
        Write-Host "User not found: $Username"
    }
}
