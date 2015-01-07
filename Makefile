all: startup.o

CC=arm-none-eabi-gcc 
AS=arm-none-eabi-as 
LD=arm-none-eabi-ld
NM=arm-none-eabi-nm
OBJCOPY=arm-none-eabi-objcopy
AR=arm-linux-ar

startup.o: kernel.o vectors.s
	$(AS) -mcpu=cortex-a9 -g vectors.s -o vectors.o	
	$(LD) -T kernel.ld kernel.o vectors.o -o kernel.elf
	#$(OBJCOPY) -O binary kernel.elf kernel.bin

kernel.o: kernel.c
	$(CC) -mcpu=cortex-a9 -g -c kernel.c -o kernel.o	

.PHONY: clean

clean:
	rm *.o 
	rm *.elf
	rm *.bin
