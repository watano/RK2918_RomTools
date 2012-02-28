@cd .\temp\%FileType%\
@chmod -R 777 ./*
@del ..\%FileType%.cpio
cpio -o -H newc < filelist > ..\%FileType%.img
@cd ..
gzip %FileType%.img
move %FileType%.img.gz %FileType%.img