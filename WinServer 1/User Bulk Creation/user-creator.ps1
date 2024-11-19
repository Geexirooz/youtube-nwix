# Path to the CSV file
$csvPath = "C:\Users\Administrator\Desktop\users.csv"
# Path to the creds folder
$outputDirectory = "C:\Users\Administrator\Desktop\UsersCredentials"

# Import the Active Directory Module
Import-Module ActiveDirectory

# Import the CSV file
$users = Import-Csv -Path $csvPath

# Ensure the output directory exists
if (!(Test-Path $outputDirectory)) {
    New-Item -Path $outputDirectory -ItemType Directory | Out-Null
}

# Generate complex random password function
Function Get-RandomPassword
{
    #define parameters
    param([Parameter(ValueFromPipeline=$false)][ValidateRange(1,256)][int]$PasswordLength = 10)
 
    #ASCII Character set for Password
    $CharacterSet = @{
            Lowercase   = (97..122) | Get-Random -Count 10 | % {[char]$_}
            Uppercase   = (65..90)  | Get-Random -Count 10 | % {[char]$_}
            Numeric     = (48..57)  | Get-Random -Count 10 | % {[char]$_}
            SpecialChar = (33..47)+(58..64)+(91..96)+(123..126) | Get-Random -Count 10 | % {[char]$_}
    }
 
    #Frame Random Password from given character set
    $StringSet = $CharacterSet.Uppercase + $CharacterSet.Lowercase + $CharacterSet.Numeric + $CharacterSet.SpecialChar
 
    -join(Get-Random -Count $PasswordLength -InputObject $StringSet)
}

# Process each user in the CSV
foreach ($user in $users) {
    $lastName = $user.LastName.ToLower()
    $firstNameInitial = $user.FirstName.Substring(0, 1).ToLower()
    $baseUsername = "$lastName.$firstNameInitial"
    $username = $baseUsername

    # Check for conflicts and append a number if necessary
    $i = 1
    while (Get-ADUser -Filter { SamAccountName -eq $username }) {
        $username = "$baseUsername$i"
        $i++
    }

    # Generate random password
    $password = Get-RandomPassword -PasswordLength 15
    $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

    # Define the Organizational Unit path
    $ou = "OU=$($user.Department),OU=$($user.City),OU=staff,DC=nwix,DC=local"

    # Create the user in Active Directory
    New-ADUser -GivenName $user.FirstName `
               -Surname $user.LastName `
               -Name "$($user.FirstName) $($user.LastName)" `
               -SamAccountName $username `
               -UserPrincipalName "$username@nwix.local" `
               -AccountPassword $securePassword `
               -Enabled $true `
               -Path $ou `
               -ChangePasswordAtLogon $true

    Write-Host "Created user: $username with OU: $ou"

    # Create a file for each user with their credentials
    $userFilePath = Join-Path $outputDirectory "$username.txt"
    Set-Content -Path $userFilePath -Value @"
Username: $username
Password: $password
"@
}

Write-Host "Credentials saved to individual files in: $outputDirectory"
