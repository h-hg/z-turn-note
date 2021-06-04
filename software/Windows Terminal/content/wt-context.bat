echo off
if not "%OS%"=="Windows_NT" exit
::move the workstation directory
cd /D %~dp0
set wtConfigDir=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\
set iconPath=%wtConfigDir%wt.ico
set admPath=%wtConfigDir%RunAsAdm.bat
set wtPath=%LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe

echo "Make sure that you're in Adminstrator mode"
echo "install: 1"
echo "uninstall: 2"
set /p CHOICE= Your choice:
if %CHOICE% == 1 goto INSTALL
if %CHOICE% == 2 goto UNINSTALL

:INSTALL
xcopy ".\wt.ico" %wtConfigDir% /y /q /v
xcopy ".\RunAsAdm.bat" %wtConfigDir% /y /q /v
::reg.exe add "HKEY_CLASSES_ROOT\Directory\Background\shell\wt" /f /ve ::should't be none value
reg.exe add "HKEY_CLASSES_ROOT\Directory\Background\shell\wt" /f /v "Icon" /d %iconPath%
reg.exe add "HKEY_CLASSES_ROOT\Directory\Background\shell\wt" /f /v "MUIVerb" /d "Open Windows Terminal As"
reg.exe add "HKEY_CLASSES_ROOT\Directory\Background\shell\wt" /f /v "SubCommands" /d "WTAsUser;WTAsAdm"
::reg.exe add "HKEY_CLASSES_ROOT\Directory\shell\wt" /f /ve ::should't be none value
reg.exe add "HKEY_CLASSES_ROOT\Directory\shell\wt" /f /v "Icon" /d %iconPath%
reg.exe add "HKEY_CLASSES_ROOT\Directory\shell\wt" /f /v "MUIVerb" /d "Open Windows Terminal As"
reg.exe add "HKEY_CLASSES_ROOT\Directory\shell\wt" /f /v "SubCommands" /d "WTAsUser;WTAsAdm"
::User
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WTAsUser" /f /d "User"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WTAsUser\command" /f /d %wtPath%
::Adm
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WTAsAdm" /f /d "Administrator"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WTAsAdm\command" /f /d %admPath%
goto EXIT

:UNINSTALL
del %iconPath% /a /f /q
del /a /f /q %admPath%
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\wt" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\wt" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WTAsUser" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WTAsAdm" /f
goto EXIT

:EXIT
pause
exit