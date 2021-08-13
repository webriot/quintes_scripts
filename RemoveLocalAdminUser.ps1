param(
        [Parameter(Position=0,mandatory=$true)]
        [string] $computerName,
        [Parameter(Position=1,mandatory=$true)]
        [string] $User
    )

Invoke-Command -ComputerName $computerName  -ArgumentList $User -ScriptBlock { Remove-LocalGroupMember -Group "Administrators" -Member $User }

