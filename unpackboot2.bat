chcp 936
call jset.bat
set rockdev_HOME=d:\android\momo8\rockdev
rmdir /s /q .\temp\boot\
@md temp
copy boot.img temp\boot.img
cd temp
del /f /q boot.img-ramdisk
del /f /q boot.img-ramdisk.gz
del /f /q boot.img-kernel
perl ../bin/split_bootimg.pl boot.img
del /f /q boot.img
gzip -d boot.img-ramdisk.gz
echo ramdisk...............
@md ramdisk
@copy boot.img-ramdisk ramdisk
@cd ramdisk
..\..\bin\cpio -itF boot.img-ramdisk > filelist
..\..\bin\cpio -i < boot.img-ramdisk
del /f /q boot.img-ramdisk
cd ..
echo kernel...............
@md kernel
@copy boot.img-kernel kernel
@cd kernel
..\..\bin\cpio -itF boot.img-kernel > filelist
..\..\bin\cpio -i < boot.img-kernel
del /f /q boot.img-kernel
pause