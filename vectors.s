.section .text

	/* ELF entry symbol */
	.global _start
_start:	
  LDR sp, =stack_top
  BL _init
  B .
