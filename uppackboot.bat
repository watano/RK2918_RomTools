@call setenv.bat
@rmdir /s /q .\temp\boot\
@md temp
@copy boot.img temp\boot.img
@cd temp
@rkrbboot.exe boot.img
@del /f /q boot.img
@gzip -d boot.img.gz
@md boot
@copy boot.img boot
@cd boot
@cpio -itF boot.img > filelist
@cpio -i < boot.img
pause