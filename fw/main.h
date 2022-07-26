#ifndef __MAIN_H__
#define __MAIN_H__

#include <stdint.h>


// 8-bit leds
#define leds 	(* (volatile uint32_t *) 	0x02000000)


// UART
#define uart_div	(* (volatile uint32_t *) 	0x02004008)
#define uart_rx		(* (volatile uint32_t *) 	0x02004000)
#define uart_tx		(* (volatile uint32_t *) 	0x02004000)


#define _FREQ_ 50000000		// 50 MHz clock
#define _BAUD_ 115200
#define UART_DIV_VALUE (int) (_FREQ_/_BAUD_) - 1	// baud = clk_freq / (divisor + 1)

#endif //__MAIN_H__