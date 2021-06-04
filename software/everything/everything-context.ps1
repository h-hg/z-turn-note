# custom
$menu_name = "Search in &Everything"

# Registry variables
$reg_dir_menu = "HKEY_LOCAL_MACHINE\Software\Classes\Directory\shell"
$reg_dir_bg_menu = "HKEY_LOCAL_MACHINE\Software\Classes\Directory\Background\shell"

Write-Output "Make sure that you're in Adminstrator mode"
Write-Output "install: 1"
Write-Output "uninstall: 2"
$choice = Read-Host 'Your choice?'

if($choice -eq "1") {
  $exe_relative_path = "apps\everything\current\everything.exe"
  
  Write-Output "Choose your position"
  Write-Output "scoop user: 1"
  Write-Output "scoop global: 2"
  Write-Output "custom: 3"
  $choice = Read-Host "Your choice?"

  if($choice -eq "1") {
    if($env:SCOOP) {
      $scoop_path = "%SCOOP%"
    } else {
      $scoop_path = $HOME + "\scoop" 
    }
    $exe_path = $scoop_path + "\" + $exe_relative_path
  } elseif($choice -eq "2") {
    if($env:SCOOP_GLOBAL) {
      $scoop_path = "%SCOOP_GLOBAL%"
    } else {
      $scoop_path = "C:\ProgramData\scoop"
    }
    $exe_path = $scoop_path + "\" + $exe_relative_path
  } elseif($choice -eq "3") {
    $exe_path = Read-Host "Input your custom path:"
  } else {
    Write-Output "No such choice!"
    return
  }

  # directory menu
  reg add "$reg_dir_menu\$menu_name" /v "Icon" /t REG_EXPAND_SZ /d "$exe_path" /f
  reg add "$reg_dir_menu\$menu_name\command" /ve /t REG_EXPAND_SZ /d "`\`"$exe_path`\`" -path `\`"%1`\`"" /f

  # directory background menu
  reg add "$reg_dir_bg_menu\$menu_name" /v "Icon" /t REG_EXPAND_SZ /d "$exe_path" /f
  reg add "$reg_dir_bg_menu\$menu_name\command" /ve /t REG_EXPAND_SZ /d "`\`"$exe_path`\`" -path `\`"%V`\`"" /f
} elseif($choice -eq "2") {
  # directory menu
  reg delete "$reg_dir_menu\$menu_name" /f
  # directory background menu
  reg delete "$reg_dir_bg_menu\$menu_name" /f
} else {
  Write-Output "No such choice!"
}
