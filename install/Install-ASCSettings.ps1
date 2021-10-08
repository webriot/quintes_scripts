# Mount Persistent Drive
New-PSDrive -Name "P" -Root "\\q-asc\ascapp" -Persist -PSProvider "FileSystem" -Scope global


#Set ENV
function Set-EnvironmentVariable
{
  param
  (
    [Parameter(Mandatory=$true)]
    [String]
    $Name,
    
    [Parameter(Mandatory=$true)]
    [String]
    $Value
    
  )
  [System.Environment]::SetEnvironmentVariable($Name, $Value, "Machine")
}

#Set ENV Values
Set-EnvironmentVariable -Name "NDM" -Value "P:\NDM"
Set-EnvironmentVariable -Name "NIAKWA_RUNTIME" -Value "P:\NPL"
