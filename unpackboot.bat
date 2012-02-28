chcp 936
set rockdev_HOME=d:\android\momo8\rockdev
rmdir /s /q .\temp\boot\
@md temp
copy boot.img temp\boot.img
cd temp
..\bin\rkrbboot.exe boot.img
del /f /q boot.img
..\bin\gzip -d boot.img.gz
@md boot
@copy boot.img boot
@cd boot
..\..\bin\cpio -itF boot.img > filelist
..\..\bin\cpio -i < boot.img
pause