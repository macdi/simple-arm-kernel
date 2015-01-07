ENTRY(_Reset)
SECTIONS
{
 . = 0x20000000;
 .text : {
 vectors.o
 *(.text)
 }
 .data : { *(.data) }
 .bss : { *(.bss COMMON) }
 . = ALIGN(8);
 . = . + 0x1000; /* 4kB of stack memory */
 stack_top = .;
}