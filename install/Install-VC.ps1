$install = 0

if ((get-wmiobject Win32_Product | where IdentifyingNumber -eq "{E493B8F4-E300-43EC-95D0-BDF3711297EA}")) {
    
    if ((get-wmiobject Win32_Product | where IdentifyingNumber -eq "{029DA848-1A80-34D3-BFC1-A6447BFC8E7F}")) {
    
        if ((get-wmiobject Win32_Product | where IdentifyingNumber -eq "{37BB1766-C587-49AE-B2DB-618FBDEAB88C}")) {
    
            if ((get-wmiobject Win32_Product | where IdentifyingNumber -eq "{42163859-095F-469B-A0B0-7748500570D1}")) {
    
                if ((get-wmiobject Win32_Product | where IdentifyingNumber -eq "{1B4EDD59-90CE-4BDE-8520-630981088165}")) {
    
                    if ((get-wmiobject Win32_Product | where IdentifyingNumber -eq "{526B224D-6B70-4A2A-9D03-CE304B5125D6}")) {
    
                        exit;
                    } else {
                        $install = 1
                    }
                } else {
                    $install = 1
                }
            } else {
                $install = 1
            }
        } else {
            $install = 1
        }
    } else {
        $install = 1
    }
} else {
    $install = 1
}

if ($install -eq 1) {
    if(!(Get-Item c:\temp)) {
        New-Item -ItemType Directory -Path c:\temp\s
    }
   Copy-Item -Path "\\Q-server\INSTALLS\Microsoft\VC\VC_redist.x64.exe" -Destination c:\temp
   Copy-Item -Path "\\Q-server\INSTALLS\Microsoft\VC\VC_redist.x86.exe" -Destination c:\temp
   "c:\temp\VC_redist.x64.exe /install /quiet /norestart" | cmd
   "c:\temp\VC_redist.x86.exe /install /quiet /norestart" | cmd
   Remove-Item C:\temp\VC_redist.x64.exe -Force
   Remove-Item C:\temp\VC_redist.x86.exe -Force
}
