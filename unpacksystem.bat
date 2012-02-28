chcp 936
set rockdev_HOME=d:\android\momo8\rockdev
rmdir /s /q .\Image\system\
bin\cramfsck_nocrc -x Image/system %rockdev_HOME%/Image/system.img
pause
