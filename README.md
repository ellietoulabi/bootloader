# A Simple Bootloader


Writing an x86 "Hello world! It's me " bootloader in ASM. <br>
Run Guide: [Link](https://github.com/ellietoulabi/bootloader/blob/9c8eedac931059b8e25938047de920335823b32d/boot.sh)

## Getting Started


These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

> ### Prerequisites

* NASM (an assembler and disassembler for the Intel x86 architecture. It can be used to write 16-bit, 32-bit and 64-bit programs)
```
sudo apt-get install nasm
```
* A virtual machine to see the result. Incase you decide to use VirtualBox as your VM you can install it using below command.
```
sudo apt install virtualbox
```

> ### Installing

First, make a directory  like mydir and put the *bootloader.asm* there.
Then change your current directory to *mydir* and follow below instructions in order to get a *.iso* file.
```
nasm -f bin -o bootloader.bin yoohoo.asm
```
```
dd if=/dev/zero of=floppy.img bs=1024 count=1440
```
```
dd if=bootloader.bin of=floppy.img seek=0 count=1 conv=notrunc
```
```
genisoimage -quiet -V 'BootLoader' -input-charset iso8859-1 -o BOOTLOADER.iso -b floppy.img -hide floppy.img ./
```
Now make a virtual machine [[Guide to VirtualBox]](https://www.virtualbox.org/manual/ch01.html) and run your *.iso* file.



## Project Description

We actually know that a bootloader is just a piece of code which blindly executes and we will see how to make our simple bootloader.
 First we should know that all x86 CPUs start in a real mode while booting and real mode supports only 16-bit instructions
 so we must tell the Assembler that we are using 16-bit by adding 1st line of code. We have an org line  which tells the assembler that the code will be loaded starting at position 0x7C00.Other code descriptions are mentioned in .asm comments but here we are going to understand what really happens behind the code:)
 When we turn on the computer the processor searches the address 0xFFFFFFF0 for the BIOS code; Then the BIOS will search for boot media and checks if each founded boot media is appropriate. Here appropriate means having 0xaa55 at the end of 512byte boot sector.That's why we added last line of code!
 SI holds message address and increaments each time to print message character by chaacter on screan untill there is no character left to print but just 0s the program stops. 




## Authors

* **Elaheh Toulabi Nejad** 

## References

* [jab](http://joebergeron.io/posts/post_two.html)
* [Youri Ackx](https://blog.sugoi.be/asm-hello-world-bootloader.html)
* [tutorialspoint](https://www.tutorialspoint.com/assembly_programming/assembly_registers.htm)
* [WIKIBOOKS](https://en.wikibooks.org/wiki/X86_Assembly/Bootloaders)

