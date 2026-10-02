@echo off
chcp 65001 >nul
setlocal EnableExtensions

set "APPNAME=Spicetify"
set "ICONURL=https://raw.githubusercontent.com/asgbdhh12-blip/spicetifylink/main/icon.ico"
set "INSTALLDIR=%ProgramData%\spicetifylink"
set "ICONFILE=%INSTALLDIR%\icon.ico"
set "TARGET=C:\Users\kenig\AppData\Local\spicetify\spicetify.exe"
set "ARGS=auto"

if not exist "%INSTALLDIR%" mkdir "%INSTALLDIR%"

echo Ładowanie...
echo Pobieranie ikony...

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%ICONURL%' -OutFile '%ICONFILE%'"

if not exist "%ICONFILE%" (
    echo Nie udalo sie pobrac ikony.
    pause
    exit /b
)

echo Tworzenie skrotow...

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$w=New-Object -ComObject WScript.Shell; $l=$w.CreateShortcut([Environment]::GetFolderPath('Desktop') + '\%APPNAME%.lnk'); $l.TargetPath='%TARGET%'; $l.Arguments='%ARGS%'; $l.IconLocation='%ICONFILE%'; $l.WorkingDirectory='C:\Users\kenig\AppData\Local\spicetify'; $l.Save()"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$w=New-Object -ComObject WScript.Shell; $l=$w.CreateShortcut('%ProgramData%\Microsoft\Windows\Start Menu\Programs\%APPNAME%.lnk'); $l.TargetPath='%TARGET%'; $l.Arguments='%ARGS%'; $l.IconLocation='%ICONFILE%'; $l.WorkingDirectory='C:\Users\kenig\AppData\Local\spicetify'; $l.Save()"

echo.
echo Gotowe!
echo.
pause
exit /b
