chcp 936
set rockdev_HOME=d:/momo8/rockdev
rmdir /s /q .\Image\system\
@echo 解压缩system.img文件到Image/system目录
bin\cramfsck_nocrc -x Image\system %rockdev_HOME%/Image/system.img
@echo 删除自带软件
del /q .\Image\system\app\TTGO*.apk
del /q .\Image\system\app\DocumentsToGo*.apk
del /q .\Image\system\app\Maps.apk
del /q .\Image\system\app\Gallery3D.apk
del /q .\Image\system\app\VideoPlayer*.apk
del /q .\Image\system\app\Street.apk
del /q .\Image\system\app\RKEBookReader.apk
del /q .\Image\system\app\Gmail.apk
del /q .\Image\system\app\Explorer.apk
del /q .\Image\system\app\BooksProvider.apk
del /q .\Image\system\app\Email.apk
del /q .\Image\system\app\flashplayer
del /q .\Image\system\app\Gfanployer*.apk
del /q .\Image\system\app\Explorer.apk
rem del /q .\Image\system\app\Talk.apk
del /q .\Image\system\app\LiveWallpapers*
del /q .\Image\system\app\1024X768_Launcher2*
@echo 覆盖当前目录下的system到解压缩的system目录下的对应文件
xcopy /s /v /y .\system .\Image\system\
@echo 设定运行权限
bin\chmod -R 0777 ./Image/system/*
bin\chmod 6755 ./Image/system/xbin/su
bin\chmod 6755 ./Image/system/bin/su
bin\chmod 6755 ./Image/system/xbin/busybox
bin\chmod 6755 ./Image/system/app/Superuser.apk
@echo 打包system.img
bin\mkcramfs -q .\Image\system system.img
@echo 备份原始system.img文件
rem move /y .\system.img %rockdev_HOME%\Image\system.img
rem copy /y /v %rockdev_HOME%\parameter_1GB %rockdev_HOME%\parameter
@echo 重新打包update.img
rem %rockdev_HOME%\Afptool -pack %rockdev_HOME% %rockdev_HOME%\Image\update.img
rem %rockdev_HOME%\RKImageMaker.exe -RK29 %rockdev_HOME%\RK29xxLoader(L)_DDR3_400Mhz_V1.64.bin  %rockdev_HOME%\Image\update.img  %rockdev_HOME%\update.img -os_type:androidos
rem move /y %rockdev_HOME%\update.img %rockdev_HOME%\Image
@echo 还原原始system.img 文件
rem del /s /q %rockdev_HOME%\Image\system.img 
rem move /y system.img.bak %rockdev_HOME%\Image\system.img 
pause
