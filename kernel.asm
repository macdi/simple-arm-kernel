
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

20000000 <_start>:
20000000:	e59fd004 	ldr	sp, [pc, #4]	; 2000000c <_start+0xc>
20000004:	eb00004f 	bl	20000148 <_init>
20000008:	eafffffe 	b	20000008 <_start+0x8>
2000000c:	20001180 	.word	0x20001180
20000010:	00002641 	.word	0x00002641
20000014:	61656100 	.word	0x61656100
20000018:	01006962 	.word	0x01006962
2000001c:	0000001c 	.word	0x0000001c
20000020:	726f4305 	.word	0x726f4305
20000024:	2d786574 	.word	0x2d786574
20000028:	06003941 	.word	0x06003941
2000002c:	0841070a 	.word	0x0841070a
20000030:	2a020901 	.word	0x2a020901
20000034:	4401      	.short	0x4401
20000036:	01          	.byte	0x01
20000037:	36          	.byte	0x36
20000038:	02000000 	.word	0x02000000
2000003c:	00002000 	.word	0x00002000
20000040:	fb010200 	.word	0xfb010200
20000044:	01000d0e 	.word	0x01000d0e
20000048:	00010101 	.word	0x00010101
2000004c:	00010000 	.word	0x00010000
20000050:	76000100 	.word	0x76000100
20000054:	6f746365 	.word	0x6f746365
20000058:	532e7372 	.word	0x532e7372
2000005c:	00000000 	.word	0x00000000
20000060:	02050000 	.word	0x02050000
20000064:	20000000 	.word	0x20000000
20000068:	2c2f2f17 	.word	0x2c2f2f17
2000006c:	01000202 	.word	0x01000202
20000070:	01          	.byte	0x01
20000071:	4d          	.byte	0x4d
20000072:	0000      	.short	0x0000
20000074:	c2000200 	.word	0xc2000200
20000078:	04200000 	.word	0x04200000
2000007c:	00003701 	.word	0x00003701
20000080:	00000020 	.word	0x00000020
20000084:	00001020 	.word	0x00001020
20000088:	63657620 	.word	0x63657620
2000008c:	73726f74 	.word	0x73726f74
20000090:	2f00532e 	.word	0x2f00532e
20000094:	656d6f68 	.word	0x656d6f68
20000098:	6369612f 	.word	0x6369612f
2000009c:	63756f68 	.word	0x63756f68
200000a0:	65642f68 	.word	0x65642f68
200000a4:	61622f76 	.word	0x61622f76
200000a8:	6d5f6572 	.word	0x6d5f6572
200000ac:	6c617465 	.word	0x6c617465
200000b0:	554e4700 	.word	0x554e4700
200000b4:	20534120 	.word	0x20534120
200000b8:	34322e32 	.word	0x34322e32
200000bc:	0031352e 	.word	0x0031352e
200000c0:	8001      	.short	0x8001
200000c2:	1101      	.short	0x1101
200000c4:	11061000 	.word	0x11061000
200000c8:	03011201 	.word	0x03011201
200000cc:	25081b08 	.word	0x25081b08
200000d0:	00051308 	.word	0x00051308
200000d4:	00000000 	.word	0x00000000
200000d8:	0000001c 	.word	0x0000001c
200000dc:	00710002 	.word	0x00710002
200000e0:	00042000 	.word	0x00042000
200000e4:	00000000 	.word	0x00000000
200000e8:	20000000 	.word	0x20000000
200000ec:	00000010 	.word	0x00000010
	...

200000f8 <print_uart0>:
//volatile unsigned int * const UART0DR = (unsigned int *)0x10009000;
//volatile unsigned int * const UART0DR = (unsigned int *)0x1c090000;

volatile unsigned int * const UART0DR = (unsigned int *)0x02020000; //UART of the i.MX6 Sabre SDB
 
void print_uart0(const char *s) {
200000f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
200000fc:	e28db000 	add	fp, sp, #0
20000100:	e24dd00c 	sub	sp, sp, #12
20000104:	e50b0008 	str	r0, [fp, #-8]
  while(*s != '\0') { /* Loop until end of string */
20000108:	ea000007 	b	2000012c <print_uart0+0x34>
    *UART0DR = (unsigned int)(*s); /* Transmit char */
2000010c:	e3a03000 	mov	r3, #0
20000110:	e3403202 	movt	r3, #514	; 0x202
20000114:	e51b2008 	ldr	r2, [fp, #-8]
20000118:	e5d22000 	ldrb	r2, [r2]
2000011c:	e5832000 	str	r2, [r3]
    s++; /* Next char */
20000120:	e51b3008 	ldr	r3, [fp, #-8]
20000124:	e2833001 	add	r3, r3, #1
20000128:	e50b3008 	str	r3, [fp, #-8]
//volatile unsigned int * const UART0DR = (unsigned int *)0x1c090000;

volatile unsigned int * const UART0DR = (unsigned int *)0x02020000; //UART of the i.MX6 Sabre SDB
 
void print_uart0(const char *s) {
  while(*s != '\0') { /* Loop until end of string */
2000012c:	e51b3008 	ldr	r3, [fp, #-8]
20000130:	e5d33000 	ldrb	r3, [r3]
20000134:	e3530000 	cmp	r3, #0
20000138:	1afffff3 	bne	2000010c <print_uart0+0x14>
    *UART0DR = (unsigned int)(*s); /* Transmit char */
    s++; /* Next char */
  }
}
2000013c:	e24bd000 	sub	sp, fp, #0
20000140:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
20000144:	e12fff1e 	bx	lr

20000148 <_init>:

void _init()
{
20000148:	e92d4800 	push	{fp, lr}
2000014c:	e28db004 	add	fp, sp, #4
  print_uart0("bare metal: Hello world!\n");
20000150:	e3000164 	movw	r0, #356	; 0x164
20000154:	e3420000 	movt	r0, #8192	; 0x2000
20000158:	ebffffe6 	bl	200000f8 <print_uart0>
  
  while(1);
2000015c:	eafffffe 	b	2000015c <_init+0x14>
