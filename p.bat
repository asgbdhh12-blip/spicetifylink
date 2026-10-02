@echo off
echo Ładowanie...
setlocal

set "APPNAME=Spicetify"
set "ICONURL=https://raw.githubusercontent.com/asgbdhh12-blip/spicetifylink/main/icon.ico"

set "INSTALLDIR=%ProgramData%\spicetifylink"
set "ICONFILE=%INSTALLDIR%\icon.ico"

if not exist "%INSTALLDIR%" mkdir "%INSTALLDIR%"

powershell -NoProfile -Command "Invoke-WebRequest '%ICONURL%' -OutFile '%ICONFILE%'"

set "TARGET=C:\Users\kenig\AppData\Local\spicetify\spicetify.exe"
set "ARGS=auto"
if not exist "%INSTALLDIR%" mkdir "%INSTALLDIR%"

powershell -Command "Invoke-WebRequest '%ICONURL%' -OutFile '%ICONFILE%'"

set "TARGET=C:\Users\kenig\AppData\Local\spicetify\spicetify.exe auto"
echo Tworzenie skrótów...
powershell -NoProfile -Command "$s=New-Object -ComObject WScript.Shell; $l=$s.CreateShortcut('%USERPROFILE%\Desktop\%APPNAME%.lnk'); $l.TargetPath='%TARGET%'; $l.Arguments='%ARGS%'; $l.IconLocation='%ICONFILE%'; $l.Save()"

powershell -Command "Start-Process cmd -Verb RunAs -ArgumentList '/c powershell -NoProfile -Command ""$s=New-Object -COM WScript.Shell; $l=$s.CreateShortcut(''C:\ProgramData\Microsoft\Windows\Start Menu\Programs\%APPNAME%.lnk''); $l.TargetPath=''C:\Users\kenig\AppData\Local\spicetify\spicetify.exe''; $l.Arguments=''auto''; $l.IconLocation=''%ICONFILE%''; $l.Save()""'"
pause
exit
