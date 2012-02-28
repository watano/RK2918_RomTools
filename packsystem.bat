@echo 设定运行权限
bin\chmod -R 0777 ./system/*
bin\chmod 6755 ./system/xbin/su
bin\chmod 6755 ./system/bin/su
bin\chmod 6755 ./system/xbin/busybox
bin\chmod 6755 ./system/app/Superuser.apk
@echo 打包system.img
bin\mkcramfs -q ./Image/system system.img
pause
