param(
        [Parameter(Position=1,mandatory=$true)]
        [string] $User
    )

$computers = Get-ADComputer

$computers | ForEach-Object {


    Invoke-Command -ComputerName $computerName  -ArgumentList $User -ScriptBlock { 
                Add-LocalGroupMember -Group "Administrators" -Member $User 
        }
    }

}

