param(
        [Parameter(Position=1,mandatory=$true)]
        [string] $User
    )

$computers = Get-ADComputer

$computers | ForEach-Object {


    Invoke-Command -ComputerName $computerName  -ArgumentList $User -ScriptBlock { 
        param($user)
        $users = Get-LocalGroupMember -Group "Administrators"
        $users | ForEach-Object {
            if($_.Name -eq $User) {
                Remove-LocalGroupMember -Group "Administrators" -Member $User 
            }
        }
    }

}

