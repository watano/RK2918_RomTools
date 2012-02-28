chcp 936
for /f %i in ('dir /b /a-d /s ".\apk\*.apk"') do (.\bin\adb install "%i")
pause