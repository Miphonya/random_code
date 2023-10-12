# Import user data from a CSV file juste change "C:\Exemple\exemple.csv" by your file
$users = Import-Csv -Path "C:\Exemple\exemple.csv"

# Define the destination Organizational Unit (OU) where users will be moved
$ouDestination = "OU=Users,OU=XXXX,DC=entreprise,DC=exemple,DC=ch"

# Loop through each user in the imported CSV
foreach ($user in $users) {
    # Retrieve the "username" attribute from the current user in the loop
    $Username = $user."username"

    # Get the DistinguishedName property of the user using the Active Directory Get-ADUser
    $UserToMove = Get-ADUser -Identity $Username -Property DistinguishedName | Select-Object -ExpandProperty DistinguishedName

    # Move the user object in Active Directory to the specified destination OU
    Move-ADObject -Identity "$UserToMove" -TargetPath "$ouDestination"

    # Output a message indicating that the user has been moved
    Write-Host "User moved: $UserToMove"
}
