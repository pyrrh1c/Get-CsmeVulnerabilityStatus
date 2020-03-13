$global:LASTEXITCODE = $null | Out-Null
Clear-Host 

Write-Host "##########################################################" -ForegroundColor Yellow
Write-Host "# Performing unit test of Get-CsmeVulnerabiltyStatus.ps1 #" -ForegroundColor Yellow
Write-Host "#         You must monitor the script for errors.        #" -ForegroundColor Yellow
Write-Host "##########################################################" -ForegroundColor Yellow
Write-Host " "


# Test downloading from websites
Write-Host "Testing script with no arguments This should work." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1
Write-Host " "

Write-Host "Testing script with the a valid -WebUrl argument. This should work." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -WebUrl http://127.0.0.1/CSME_Version_Detection_Tool_Windows.zip
Write-Host " "

Write-Host "Testing script with an invalid -WebUrl argument. This should error." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -WebUrl http://127.0.0.1/foobar.zip
Write-Host " "

# Test downloading from SMB
Write-Host "Testing script with a valid -SmbPath argument. This should work." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -SmbPath \\127.0.0.1\csme\CSME_Version_Detection_Tool_Windows.zip
Write-Host " "

Write-Host "Testing script with an invalid -SmbPath argument. This should error." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -SmbPath \\foo\bar\foobar.zip
Write-Host " "

# Test Logging
Write-Host "Testing script with the a -LogDir argument with no path. This should error." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -LogDir
Write-Host " "

Write-Host "Testing script with the -LogDir argument and a valid path. This should work and create or append to the log file." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -LogDir \\127.0.0.1\csme\
Write-Host " "

Write-Host "Testing script with the -LogDir argument and an invalid path. This should error." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -LogDir \\foo\bar\
Write-Host " "

Write-Host "Testing script with the -LogDir and -LogFileName arguments, but no actual log file name. This should error." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -LogDir \\127.0.0.1\csme\ -LogFileName
Write-Host " "

Write-Host "Testing script with the -LogDir and -LogFileName arguments and a valid file name. This should work and create or append to the custom log file." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -LogDir \\127.0.0.1\csme\ -LogFileName test.txt
Write-Host " "

# Test the NoCleanUp argument
Write-Host "Testing script with the -NoCleanUp argument. This should work and leave a temporary directory after completion." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -WebUrl http://127.0.0.1/CSME_Version_Detection_Tool_Windows.zip -NoCleanUp
Write-Host " "

# Test Verbose mode
Write-Host "Testing script in verbose mode This should work and produce verbose statements." -ForegroundColor Yellow
.\Get-CsmeVulerabilityStatus.ps1 -Verbose
Write-Host " "

Write-Host "Testing Complete."