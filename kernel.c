
//volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;
//volatile unsigned int * const UART0DR = (unsigned int *)0x10009000; //UART of the realview baseboard platform
//volatile unsigned int * const UART0DR = (unsigned int *)0x1c090000; 

volatile unsigned int * const UART0DR = (unsigned int *)0x02020000;   //UART of the i.MX6 Sabre SDB
 
void print_uart0(const char *s) {
  while(*s != '\0') { /* Loop until end of string */
    *UART0DR = (unsigned int)(*s); /* Transmit char */
    s++; /* Next char */
  }
}

void _init()
{
  //print_uart0("bare metal: Hello world!\n");

  int id;
  int count;

  asm volatile("mov r1, #7       \n"                                                                                                                                                                    
               "dsb              \n"                                                                                                                                                        
               "dmb              \n"                                                                                                                                                        
	       "smc #0           \n"                                                                                                                                                        
	       "mov %[value], r0 \n"                                                                                                                                                        
	       : [value] "=r" (id) :: "r0", "r1");    
  
  while(1) {
    count = count + 1;
  }

}
