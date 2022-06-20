all:
	make clean
	make binaries
	make floppy
	make run

binaries:
	nasm -fbin -o output/boot.bin src/bootloader.asm
	nasm -fbin -o output/good.bin src/sector.asm
	cat output/boot.bin output/good.bin > output/system.bin
run:
	qemu-system-x86_64 output/system.bin

floppy:
	dd if=/dev/zero of=output/floppy.img bs=1024 count=1440
	dd if=output/system.bin of=output/floppy.img seek=0 count=1 conv=notrunc

clean:
	del output/
	mkdir output
