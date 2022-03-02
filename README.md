# Bootloader
A bootloader written in ASM. This program print a simple line:)

## Project Description

We actually know that a bootloader is just a piece of code which blindly executes and we will see how to make our simple bootloader.
 First we should know that all x86 CPUs start in a real mode while booting and real mode supports only 16-bit instructions
 so we must tell the Assembler that we are using 16-bit by adding 1st line of code. We have an org line  which tells the assembler that the code will be loaded starting at position 0x7C00.Other code descriptions are mentioned in .asm comments but here we are going to understand what really happens behind the code:)
 When we turn on the computer the processor searches the address 0xFFFFFFF0 for the BIOS code; Then the BIOS will search for boot media and checks if each founded boot media is appropriate. Here appropriate means having 0xaa55 at the end of 512byte boot sector.That's why we added last line of code!
 SI holds message address and increaments each time to print message character by chaacter on screan untill there is no character left to print but just 0s the program stops. 

