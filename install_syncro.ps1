$computers = Get-AdComputer -filter * | select name


$command = { 
    $Url = "full url exe download link"
    $SavePath = "c:\Windows\Temp\SyncroSetup.exe"

    $WebClient = New-Object System.Net.WebClient
    $downloadResults = $WebClient.DownloadFile($Url,$SavePath)

    $FileArguments = "--console --customerid ###### --policyid #####"
    $runProcessResults = Start-Process -Filepath "$SavePath" -ArgumentList "$FileArguments"
}

$computers | Invoke-Command -ComputerName $_ -ScriptBlock $command
