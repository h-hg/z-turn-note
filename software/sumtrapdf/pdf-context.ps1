# custom
$reg_file_ass = "HKEY_CLASSES_ROOT\.pdf"
$reg_pdf_config_name = "wpspdf"
$sandboxie = "D:\Program Files\Sandboxie-Plus\Start.exe"
$wpspdf = "C:\Users\h_hg\AppData\Local\Kingsoft\Kingsoft PDF\11.6.0.8775\office6\wpspdf.exe"
$icon = "D:\Sandbox\china\drive\C\Users\h_hg\AppData\Local\Kingsoft\Kingsoft PDF\11.6.0.8775\office6\wpspdf.exe"
$box = "china"

Write-Output "Make sure that you're in Adminstrator mode"
Write-Output "install: 1"
Write-Output "uninstall: 2"
$choice = Read-Host 'Your choice?'

if($choice -eq "1") {
  # associate the file
  reg add "$reg_file_ass" /ve /d "$reg_pdf_config_name" /f
  reg add "HKEY_CLASSES_ROOT\$reg_pdf_config_name" /ve /d "WPS PDF" /f
  reg add "HKEY_CLASSES_ROOT\$reg_pdf_config_name\DefaultIcon" /ve /t REG_EXPAND_SZ /d "$icon" /f
  reg add "HKEY_CLASSES_ROOT\$reg_pdf_config_name\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "`\`"$sandboxie`\`" /box:$box `\`"$wpspdf`\`" `\`"%1`\`"" /f

} elseif($choice -eq "2") {
  # associate the file
  reg add "$reg_file_ass" /ve
  reg deletee "HKEY_CLASSES_ROOT\$reg_pdf_config_name" /f

} else {
  Write-Output "No such choice!"
}
