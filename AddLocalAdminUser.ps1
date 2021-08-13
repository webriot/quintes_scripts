param(
        [Parameter(Position=0,mandatory=$true)]
        [string] $computerName,
        [Parameter(Position=1,mandatory=$true)]
        [string] $User
    )

Invoke-Command -ComputerName $computerName  -ArgumentList $User -ScriptBlock { param($user) Add-LocalGroupMember -Group "Administrators" -Member $user }

