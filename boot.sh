nasm -f bin -o bootloader.bin yoohoo.asm
dd if=/dev/zero of=floppy.img bs=1024 count=1440
dd if=bootloader.bin of=floppy.img seek=0 count=1 conv=notrunc
genisoimage -quiet -V 'BootLoader' -input-charset iso8859-1 -o BOOTLOADER.iso -b floppy.img     -hide floppy.img ./
