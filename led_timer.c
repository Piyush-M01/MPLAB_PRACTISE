#include<lpc21xx.h>
void delay(void);
int main(void)
{
	unsigned long int c=0xff0000;
	IO0DIR=c;
	VPBDIV=2;
	T0MCR=(1<<0)|(1<<2);
	T0MR0=10000000;
	TOPR=29;
	
	while(1)
	{
		IO0SET=c;
		delay();
		c-=0x10000;
		IO0CLR=0XFF0000;
	}
}
void delay(void)
{
	T0TCR=(1<<0);
	while(!(T0IR&(1<<0)));
	TOIR=(1<<0);
	TOTCR=(1<<1);
}