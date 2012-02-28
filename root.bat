echo off
chcp 936
cd bin
adb remount
adb push su /system/xbin/su
adb push busybox /system/xbin/busybox
adb push Superuser.apk /system/app/Superuser.apk
adb shell busybox chmod 6755 /system/xbin/su
adb shell busybox chmod 6755 /system/xbin/busybox
adb shell busybox chmod 6755 /system/app/Superuser.apk
rem adb shell ln /system/xbin/su /system/bin/su
rem adb shell ln /system/xbin/busybox /system/bin/busybox
pause
