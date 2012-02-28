chcp 936
rmdir /s /q .\bak
.\bin\adb pull /data/data/ ./bak/data/
.\bin\adb pull /data/app/ ./bak/app/
pause