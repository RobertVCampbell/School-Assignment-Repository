#include "compiler_defs.h"
#include "C8051F320_defs.h"
#include <stdio.h>
//#include <string.h>

extern void Init_Device(void);

void main()
{
	int i;
	unsigned char string[] = {'H', 'e', 'y', ' ', 't', 'h', 'e', 'r', 'e'};

	Init_Device();
	
	while (1) 
	{
		for (i = 0; i <9; i++)
		{
			SBUF0 = string[i];
			//while (TI0 == 0) {};
			//TI0 = 0;
			while ((SCON0 & 0x02) == 0) {};
			SCON0 = SCON0 & 0xFD;
		}
    }
}