chcp 936
@bin\chmod -R 777 temp/boot/*
@cd temp\boot
del /f /q boot.img
..\..\bin\cpio -o -H newc < filelist > boot.img
..\..\bin\gzip -1 boot.img
@cd ..\..
del /f /q temp\boot.img
@move temp\boot\boot.img.gz temp\boot.img
@bin\AddCrc32 temp\boot.img temp\boot_crc.img
@del /f /q temp\boot.img
@move temp\boot_crc.img temp\boot.img
pause
