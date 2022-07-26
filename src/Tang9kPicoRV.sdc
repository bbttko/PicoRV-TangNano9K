//Copyright (C)2014-2022 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.8.05 
//Created Time: 2022-06-17 17:07:32
create_clock -name clk1 -period 37.037 -waveform {0 18.518} [get_ports {clock27M}]
create_generated_clock -name sysclk -source [get_ports {clock27M}] -master_clock clk1 -divide_by 27 -multiply_by 50 [get_nets {clock_main}]
