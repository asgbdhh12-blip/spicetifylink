@echo off
chcp 65001 >nul

eecho Ładowanie...
echo Pobieranie ikony...

if not exist "C:\ProgramData\spicetifylink" mkdir "C:\ProgramData\spicetifylink"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/asgbdhh12-blip/spicetifylink/main/icon.ico' -OutFile 'C:\ProgramData\spicetifylink\icon.ico'"

echo Tworzenie skrotu na pulpicie...

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$w=New-Object -ComObject WScript.Shell; $l=$w.CreateShortcut('C:\Users\kenig\Desktop\Spicetify.lnk'); $l.TargetPath='C:\Users\kenig\AppData\Local\spicetify\spicetify.exe'; $l.Arguments='auto'; $l.IconLocation='C:\ProgramData\spicetifylink\icon.ico'; $l.WorkingDirectory='C:\Users\kenig\AppData\Local\spicetify'; $l.Save()"

echo Tworzenie skrotu w Menu Start...

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$w=New-Object -ComObject WScript.Shell; $l=$w.CreateShortcut('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Spicetify.lnk'); $l.TargetPath='C:\Users\kenig\AppData\Local\spicetify\spicetify.exe'; $l.Arguments='auto'; $l.IconLocation='C:\ProgramData\spicetifylink\icon.ico'; $l.WorkingDirectory='C:\Users\kenig\AppData\Local\spicetify'; $l.Save()"

echo.
echo Gotowe!
pause
