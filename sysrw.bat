echo off
chcp 936
echo "作者:watano 修改自Wendal作品"
echo "请确定USB调试已经打开,并且已经插入USB"
pause
cd bin
adb shell mkdir /data/sysrw
adb shell mkdir /data/sysrw/xbin
adb shell mkdir /data/sysrw/bin
adb shell mkdir /data/sysrw/app
adb push su /data/sysrw/xbin/su
adb push busybox /data/sysrw/xbin/busybox
adb push Superuser.apk /data/sysrw/app/Superuser.apk
adb shell chmod 6755 /data/sysrw/xbin/su
adb shell chmod 6755 /data/sysrw/xbin/busybox
adb shell chmod 6755 /data/sysrw/app/Superuser.apk
adb shell ln /data/sysrw/xbin/su /data/sysrw/bin/su
adb shell ln /data/sysrw/xbin/busybox /data/sysrw/bin/busybox
echo "复制system文件到/data/sysrw/,请等待..."
adb shell /data/sysrw/xbin/busybox cp -r /system/* /data/sysrw/

echo "如果没有任何提示信息则初始化完成"
pause

echo "现在,请拔出USB->按住Menu键->插入USB->捅reset键->松开menu键->进入刷机模式->勾选boot,其他的都不选->选择update.img文件->执行"
start ..\RKAndroid_v1.29\RKAndroidTool.exe
pause