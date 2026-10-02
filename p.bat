@echo off
echo Ładowanie...
setlocal

set "APPNAME=Spicetify"
set "ICONURL=https://raw.githubusercontent.com/asgbdhh12-blip/spicetifylink/main/icon.ico"

set "INSTALLDIR=%ProgramData%\spicetifylink"
set "ICONFILE=%INSTALLDIR%\icon.ico"

if not exist "%INSTALLDIR%" mkdir "%INSTALLDIR%"

powershell -Command "Invoke-WebRequest '%ICONURL%' -OutFile '%ICONFILE%'"

set "TARGET=C:\Users\kenig\AppData\Local\spicetify\spicetify.exe auto"
echo Tworzenie skrótów...
powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\%APPNAME%.lnk');" ^
"$s.TargetPath='%TARGET%';" ^
"$s.IconLocation='%ICONFILE%';" ^
"$s.Save()"

powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\%APPNAME%.lnk');" ^
"$s.TargetPath='%TARGET%';" ^
"$s.IconLocation='%ICONFILE%';" ^
"$s.Save()"

pause
exit
