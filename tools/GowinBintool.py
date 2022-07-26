#!/usr/bin/python3
from datetime import datetime
import sys


'''
converts riscv binary file to gowin defparam v
'''

import sys, os
from os.path import getsize
from math import ceil, log

def clog2(value):
	return ceil(log(value, 2))

def get_next_block(size):
	'''
	$clog2(size)
	'''
	return 2**ceil(log(size, 2))
	
	
def bytes_from_file(filename, chunksize=4):
	'''
	chunksize is the number of bytes
	ie chunksize 4 = 4 bytes = 8 nibbles => "01020304" 
	'''
	with open(filename, 'rb') as f:
		while True:
			chunk = f.read(chunksize)
			if chunk:
				yield chunk		
			else:
				break



def output_header(ofile, memsize, i0, i1, i2, i3):	
	'''
	called by do_romv 
	'''
	now = datetime.now()
	dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
	ofile.write(f"/* file generated {dt_string} */\n")
	ofile.write(
	'''module myrom(
	output wire [31:0] dout,
	input wire clk,
	input wire oce,
	input wire ce,
	input wire reset,
	''')
	ofile.write(f"input wire [{ clog2(memsize * 8 / 32)-1 }:0] ad\n\t);\n")
	ofile.write("\twire gw_gnd;\n\tassign gw_gnd = 1'b0;\n\n")



def output_block(ofile, i_list, blockno, memsize):
	'''
	called by do_romv 
	'''
	linecount = 0
	if len(i_list) == 0:
		return

	if memsize <= 4096:
		datawidth=16
		numgnd=4
	else:
		datawidth = 8
		numgnd=3

	ofile.write(f"\twire [{31-datawidth}:0] prom_inst_{blockno}_dout_w;\n")
	ofile.write(f"\tpROM prom_inst_{blockno} (\n\t\t.DO({{prom_inst_{blockno}_dout_w[{31-datawidth}:0],dout[{(blockno*datawidth)+(datawidth-1)}:{blockno*datawidth}]}}),\n")
	ofile.write(
	'''\t\t.CLK(clk),
        .OCE(oce),
        .CE(ce),
        .RESET(reset),
	''')
	ofile.write(f"\t.AD({{ad[{clog2(memsize * 8 / 32)-1}:0], {{ {numgnd}{{gw_gnd}} }} }})\n\t);\n")
	ofile.write(f"\tdefparam prom_inst_{blockno}.READ_MODE = 1'b0;\n")
	ofile.write(f"\tdefparam prom_inst_{blockno}.BIT_WIDTH = {datawidth};\n")
	ofile.write(f"\tdefparam prom_inst_{blockno}.RESET_MODE = \"SYNC\";\n")
	for i in i_list:
		ofile.write(f"\tdefparam prom_inst_{blockno}.INIT_RAM_{linecount:02X} = 256'h{i};\n")
		linecount += 1
	ofile.write("\n")
		


def do_romv(infilename, outfilename):
	ofile = open(outfilename, 'w')
	
	counter = 0
	(i0,i1,i2,i3) = ([],[],[],[])
	(inst0,inst1,inst2,inst3) = ("","","","")

	'''
	each mem block is 2048 bytes,
		if mem contents < 4096, then split 2 blocks
		if mem contents >= 4096, split to 4 blocks
	'''
	memsize = getsize(infilename)

	if memsize <= 4096:
		for b in bytes_from_file(infilename):
			value = int.from_bytes(b, 'little')		# correct
			str = f"{value:08X}"		# convert to 32-bits
			inst0 = str[4:] + inst0
			inst1 = str[:4] + inst1
			counter+= 1
			if counter == 16:
				i0.append(f"{inst0}")
				i1.append(f"{inst1}")
				inst0 = ""
				inst1 = ""
				counter = 0
		if len(inst0):
			numzeros = 64-len(inst0)
			i0.append(f"{'0'*numzeros}{inst0}")
		if len(inst1):
			numzeros = 64-len(inst1)
			i1.append(f"{'0'*numzeros}{inst1}")

	else:
		for b in bytes_from_file(infilename):
			value = int.from_bytes(b, 'little')		# correct
			str = f"{value:08X}"		# convert to 32-bits
			inst3 = str[0:2] + inst3
			inst2 = str[2:4] + inst2
			inst1 = str[4:6] + inst1
			inst0 = str[6:8] + inst0
			counter+= 1
			if counter == 32:
				i0.append(f"{inst0}")
				i1.append(f"{inst1}")
				i2.append(f"{inst2}")
				i3.append(f"{inst3}")
				(inst0,inst1,inst2,inst3) = ("","","","")
				counter = 0
		if len(inst0):
			numzeros = 64-len(inst0)
			i0.append(f"{'0'*numzeros}{inst0}")
		if len(inst1):
			numzeros = 64-len(inst1)
			i1.append(f"{'0'*numzeros}{inst1}")
		if len(inst2):
			numzeros = 64-len(inst2)
			i2.append(f"{'0'*numzeros}{inst2}")
		if len(inst3):
			numzeros = 64-len(inst3)
			i3.append(f"{'0'*numzeros}{inst3}")
		
	output_header(ofile, memsize, i0, i1, i2, i3)	
	output_block(ofile, i0, 0, memsize)
	output_block(ofile, i1, 1, memsize)
	output_block(ofile, i2, 2, memsize)
	output_block(ofile, i3, 3, memsize)
	ofile.write("endmodule")
	print(f"rom file.. '{outfilename}' done")








def do_mi(infilename, outfilename):
	depth= get_next_block( getsize(infilename) * 8 / 32 )
	#depth = 1024
	
	mif = open(outfilename, 'w')
	mif.write(f"#File_format=AddrHex\n#Address_depth={depth}\n#Data_width=32\n")
	addr=0
	outstr = ""
	for b in bytes_from_file(infilename):
		value = int.from_bytes(b, 'little')		# correct
		outstr = "{:X}:{:08X}\n".format(addr, value)
		#outstr = "{:08X}\n".format(value)
		mif.write(outstr)
		addr += 1
	print(f"bin2mi.. '{outfilename}' done")
	mif.close()
	
	
def do_256(infilename, outfilename):
	mif = open(outfilename, 'w')
	outstr = ""
	lineno = 0
	for b in bytes_from_file(infilename, int(256/2)):
		value = int.from_bytes(b, 'little')		# correct
		outstr = f"\tdefparam brom_prom.INIT_RAM_{lineno:02X} = {len(b)*2}'h{value:0{len(b)*2}X};\n"
		mif.write(outstr)
		lineno += 1
	print(f"bin2 256 '{outfilename}'.. done")
	mif.close()

def help():
	print('v'*50)
	print('__RiscV binary converter for Gowin__')
	print('run with python v3')
	print(f'usage:\n\t {sys.argv[0]} <infile.bin> <outfile.v> <option>')
	print("where <option> :\n\t'v'  = verilog output(default)\n\t'mi' = mi format\n\t'vh' = 256h-type output")
	print('^'*50)

	
if __name__ == "__main__":
	if len(sys.argv) < 3:
		help()
		sys.exit()
		
	infilename = sys.argv[1]
	outfilename = sys.argv[2]
	try:
		option = sys.argv[3]
	except:
		option = 'v'

		
	if option == 'v':
		do_romv(infilename, outfilename)
	if option == 'mi':
		do_mi(infilename, outfilename)
	if option == 'vh':
		do_256(infilename, outfilename)

	if option not in ['v', 'mi', 'vh']:
		print(f"invalid option {option}")
		help()
	