@rmdir /s /q .\temp\%FileType%
@copy %FileType%.img temp\%FileType%.cpio.gz
@cd temp
@gzip -d %FileType%.cpio.gz
@md %FileType%
@cd %FileType%
cpio -it -F ../%FileType%.cpio > filelist
cpio -i -F ../%FileType%.cpio