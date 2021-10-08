Import-Module $env:SyncroModule -WarningAction SilentlyContinue
$install = @()
$SharePath = "\\q-server\INSTALLS\LaserFiche\LF 10.4 Installation\en\WindowsClient"
# Combined ARP
$combinedARP = New-Object -TypeName PSObject 
$combinedARP | Add-Member -MemberType NoteProperty -Name 'Name' -Value "Combined ARP" 
$combinedARP | Add-Member -MemberType NoteProperty -Name 'Path' -Value "$SharePath\CombinedARP-x64.msi"
$install += $combinedARP
# Laserfiche 10.4
$laserfiche = New-Object -TypeName PSObject 
$laserfiche | Add-Member -MemberType NoteProperty -Name 'Name' -Value "Laserfiche 10.4" 
$laserfiche | Add-Member -MemberType NoteProperty -Name 'Path' -Value "$SharePath\lf_en.msi"
$install += $laserfiche
# Laserfiche Office Integration
$lfoffice = New-Object -TypeName PSObject 
$lfoffice | Add-Member -MemberType NoteProperty -Name 'Name' -Value "Laserfiche Office Integration" 
$lfoffice | Add-Member -MemberType NoteProperty -Name 'Path' -Value "$SharePath\lfoffice-x64_en.msi"
$install += $lfoffice
# Laserfiche PhotoDocs
$lfphoto = New-Object -TypeName PSObject 
$lfphoto | Add-Member -MemberType NoteProperty -Name 'Name' -Value "Laserfiche PhotoDocs" 
$lfphoto | Add-Member -MemberType NoteProperty -Name 'Path' -Value "$SharePath\lfphotodocs_en.msi"
$install += $lfphoto
# Laserfiche Scanning
$lfscanning = New-Object -TypeName PSObject 
$lfscanning | Add-Member -MemberType NoteProperty -Name 'Name' -Value "Laserfiche Scanning" 
$lfscanning | Add-Member -MemberType NoteProperty -Name 'Path' -Value "$SharePath\lfscanning_en.msi"
$install += $lfscanning
# Laserfiche Scanning
$lfsnapshot = New-Object -TypeName PSObject 
$lfsnapshot | Add-Member -MemberType NoteProperty -Name 'Name' -Value "Laserfiche Scanning" 
$lfsnapshot | Add-Member -MemberType NoteProperty -Name 'Path' -Value "$SharePath\lfsnapshot-x64_en.msi"
$install += $lfsnapshot

$install | ForEach-Object {
    $args = "/i $_.Path /l*v c:\log.txt /qn /norestart /quiet"
    $return = Start-Process msiexec -ArgumentList $args -Wait -passthru
    If (@(0,3010) -contains $return.exitcode) { 
        write-host "Install of $_.Name completed" 
    } else {
        Rmm-Alert -Category "Installation Failed" -Body "Installation of $_.Name failed."
    }   
}
