/*
*/
#include <stdint.h>
#include "irq.h"
#include "print.h"

extern void bootload();
extern void delay_1s();

// system
#define _FREQ_ 50000000		// 50 MHz clock

// 8-bit leds
#define leds 	(* (volatile uint32_t *) 	0x02000000)

// UART
// #define uart_addr_base	0x02004100
// #define uart_write	(* (volatile uint32_t *) uart_addr_base)
// #define uart_read 	(* (volatile uint32_t *) (uart_addr_base + 1))
// #define uart_status	(* (volatile uint32_t *) (uart_addr_base + 2))
						// TRDY <= (3);
						// RRDY <= (2);
						// TX_OVERRUN <= (1);
						// RX_OVERRUN <= (0);

typedef struct {
	volatile uint32_t DATA;
	volatile uint32_t dummy;
	volatile uint32_t CLKDIV;
} PICOUART;

#define UART0 ((PICOUART *) 0x02004000)
// #define uart_div	(* (volatile uint32_t *) 	0x02004008)
// #define uart_rx		(* (volatile uint32_t *) 	0x02004000)
// #define uart_tx		(* (volatile uint32_t *) 	0x02004000)
#define _BAUD_ 115200
#define UART_DIV_VALUE (int) (_FREQ_/_BAUD_) - 1	// baud = clk_freq / (divisor + 1)



// proto
char greet[] = "\r\nGowin Tang9K [RiscV]\n\r";

uint8_t rxval = 'x';
uint32_t flash_data;
uint32_t val = 0;

void timer_handler(void) {
	leds = val++;
	if (val == 0x40)  val = 0;
	set_timer(_FREQ_);

}


void irq_20_handler(void) {
	print_hex(val,2);
}



void menu() {
	print_str("\n\r[a] - riscv printing\n\r");
	print_str("[t] - timer interrupt to count leds (toggle)\n\r");
	print_str("[b] - button interrupt output led data to uart (toggle)\n\r");
	print_str("others - echo command\n\r");
}

/*
 * main ===============================================================================
 */
int main() {
	uint32_t i;
	uint8_t rx_temp;
	uint8_t timer_enabled = 0;
	uint8_t button_irq_enabled = 0;
	
	// uart setup
	// uart_div = UART_DIV_VALUE;
	UART0->CLKDIV = UART_DIV_VALUE;

	menu();
	
	// Initialize LCD
	print_str("\n\rrunning..\n\r");
	delay_1s();
	while (1) {
		if ((rx_temp = UART0->DATA) != 0xff) {
			rxval = rx_temp;
			switch(rx_temp) {
				case 'a':
					print_str(greet);
					break;
				case 't':
					if (timer_enabled) {
						print_str("disabling timer irq\n\r");
						irq_mask_one_bit(IRQ0_TIMER);
					} else {
						print_str("enabling timer irq\n\r");
						irq_unmask_one_bit(IRQ0_TIMER);
						set_timer(_FREQ_);
					}
					timer_enabled = timer_enabled ? 0 : 1;
					break;
				case 'b':
					if (button_irq_enabled) {
						print_str("button irq20 disabled\n\r");
						irq_mask_one_bit(IRQ20_BUTTON0);
					} else {
						print_str("button irq20 enabled\n\r");
						irq_unmask_one_bit(IRQ20_BUTTON0);
					}
					button_irq_enabled = button_irq_enabled ? 0 : 1;
					break;
				default:
					UART0->DATA = rx_temp;		// echo
					break;
			}
		}
	}
	return 0;
}
//  main end ===============================================================================
