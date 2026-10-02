@echo off
chcp 65001
echo Ładowanie...
setlocal

set "APPNAME=Spicetify"
set "ICONURL=https://raw.githubusercontent.com/asgbdhh12-blip/spicetifylink/main/icon.ico"

set "INSTALLDIR=%ProgramData%\spicetifylink"
set "ICONFILE=%INSTALLDIR%\icon.ico"

set "TARGET=C:\Users\kenig\AppData\Local\spicetify\spicetify.exe"
set "ARGS=auto"

if not exist "%INSTALLDIR%" mkdir "%INSTALLDIR%"

echo Pobieranie ikony...
powershell -NoProfile -Command "Invoke-WebRequest -Uri '%ICONURL%' -OutFile '%ICONFILE%'"

echo Tworzenie skrótów...

powershell -NoProfile -Command "$w=New-Object -ComObject WScript.Shell; $l=$w.CreateShortcut('%USERPROFILE%\Desktop\%APPNAME%.lnk'); $l.TargetPath='%TARGET%'; $l.Arguments='%ARGS%'; $l.IconLocation='%ICONFILE%'; $l.WorkingDirectory='C:\Users\kenig\AppData\Local\spicetify'; $l.Save()"

powershell -NoProfile -Command "$w=New-Object -ComObject WScript.Shell; $l=$w.CreateShortcut('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\%APPNAME%.lnk'); $l.TargetPath='%TARGET%'; $l.Arguments='%ARGS%'; $l.IconLocation='%ICONFILE%'; $l.WorkingDirectory='C:\Users\kenig\AppData\Local\spicetify'; $l.Save()"

echo.
echo Gotowe!
pause
exit
