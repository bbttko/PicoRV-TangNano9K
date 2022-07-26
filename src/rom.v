/* file generated 26/07/2022 17:36:04 */
module myrom(
	output wire [31:0] dout,
	input wire clk,
	input wire oce,
	input wire ce,
	input wire reset,
	input wire [9:0] ad
	);
	wire gw_gnd;
	assign gw_gnd = 1'b0;

	wire [15:0] prom_inst_0_dout_w;
	pROM prom_inst_0 (
		.DO({prom_inst_0_dout_w[15:0],dout[15:0]}),
		.CLK(clk),
        .OCE(oce),
        .CE(ce),
        .RESET(reset),
		.AD({ad[9:0], { 4{gw_gnd} } })
	);
	defparam prom_inst_0.READ_MODE = 1'b0;
	defparam prom_inst_0.BIT_WIDTH = 16;
	defparam prom_inst_0.RESET_MODE = "SYNC";
	defparam prom_inst_0.INIT_RAM_00 = 256'hAC23AA23A823A6238113A423C10BA223410BA023410B0093218BA10B0013006F;
	defparam prom_inst_0.INIT_RAM_01 = 256'hAC23AA23A823A623A423A223A023AE23AC23AA23A823A623A423A223A023AE23;
	defparam prom_inst_0.INIT_RAM_02 = 256'hA103200BA103009300EFC58B8513AE23AC23AA23A823A623A423A223A023AE23;
	defparam prom_inst_0.INIT_RAM_03 = 256'hA783A703A683A603A583A503A483A403A383A303A283A203A183210BA103208B;
	defparam prom_inst_0.INIT_RAM_04 = 256'hAF83AF03AE83AE03AD83AD03AC83AC03AB83AB03AA83AA03A983A903A883A803;
	defparam prom_inst_0.INIT_RAM_05 = 256'h0613059305130493041303930313029302130193011321370093000B410BC08B;
	defparam prom_inst_0.INIT_RAM_06 = 256'h0E130D930D130C930C130B930B130A930A130993091308930813079307130693;
	defparam prom_inst_0.INIT_RAM_07 = 256'h2517C8E385930713A0232683DC630613261785932597071317370F930F130E93;
	defparam prom_inst_0.INIT_RAM_08 = 256'h879307B7006F00EF051300EF00EF051300EF4CE3051320235863859325970513;
	defparam prom_inst_0.INIT_RAM_09 = 256'hA023470307B700EF00EF05132517072307A3079304132C232E23011380678023;
	defparam prom_inst_0.INIT_RAM_0A = 256'h25178067011324032083A02307B700EF1AE30793A70347B78C6307A387134783;
	defparam prom_inst_0.INIT_RAM_0B = 256'h2423262301138067011324039EE387938793C7B704132E230113F06F00EF0513;
	defparam prom_inst_0.INIT_RAM_0C = 256'h8513F7B7A22327B716630793A70327B720230737222327378693A78327B70413;
	defparam prom_inst_0.INIT_RAM_0D = 256'h001300EF85130593A78327B704132423262301138067011324032083001300EF;
	defparam prom_inst_0.INIT_RAM_0E = 256'h851317B700EF851317B700EF851317B704132423262301138067011324032083;
	defparam prom_inst_0.INIT_RAM_0F = 256'h47B7072307A304132C232E2301138067011324032083001300EF851317B700EF;
	defparam prom_inst_0.INIT_RAM_10 = 256'h8C23470327B706E30793470306A3A78347B7F0EF00EF851317B7F0EFA4230713;
	defparam prom_inst_0.INIT_RAM_11 = 256'h8E634783006F00EF851327B7006F866307138863071342630713886307134783;
	defparam prom_inst_0.INIT_RAM_12 = 256'hB793478300EF8513F7B700EF051300EF851317B7006F00EF051300EF851317B7;
	defparam prom_inst_0.INIT_RAM_13 = 256'h00EF051300EF851317B7006F00EF051300EF851317B78E634783006F07A3F793;
	defparam prom_inst_0.INIT_RAM_14 = 256'h011324030013041326230113F06F0013A023470347B7006F0723F793B7934783;
	defparam prom_inst_0.INIT_RAM_15 = 256'h262304132C232E2301138067011324030013678B0713262304132E2301138067;
	defparam prom_inst_0.INIT_RAM_16 = 256'h240320830013F0EF8513A78327B7AE2327B76733A78327B7871317B307132783;
	defparam prom_inst_0.INIT_RAM_17 = 256'h27B77733A78327B78713C79317B307132783262304132C232E23011380670113;
	defparam prom_inst_0.INIT_RAM_18 = 256'h071326232E2304132623011380670113240320830013F0EF8513A78327B7AE23;
	defparam prom_inst_0.INIT_RAM_19 = 256'hA70327B72423262304132C232E2301138067011324038513278326238793078B;
	defparam prom_inst_0.INIT_RAM_1A = 256'h846377B307B72703F0EF8463F7932783F0EF8513A78327B7AE2327B767332783;
	defparam prom_inst_0.INIT_RAM_1B = 256'h8513A78327B7AE2327B77733A78327B7C7132783F0EF846377B307B72703F0EF;
	defparam prom_inst_0.INIT_RAM_1C = 256'h0013A023470347B707A3079304132E230113806701132403208385132783F0EF;
	defparam prom_inst_0.INIT_RAM_1D = 256'hC7832783A02347B7C703262387132783006F262304132E230113806701132403;
	defparam prom_inst_0.INIT_RAM_1E = 256'h262387932783006F262307932E230413262301138067011324030013001390E3;
	defparam prom_inst_0.INIT_RAM_1F = 256'h041326230113806701132403001300131CE327030793A02347B78713C7832783;
	defparam prom_inst_0.INIT_RAM_20 = 256'h47B7C70307B307131737F79357B327032783006F26239793879327832C232E23;
	defparam prom_inst_0.INIT_RAM_21 = 256'h6E6920766972205D0D0A80670113240300130013D4E32783262387932783A023;
	defparam prom_inst_0.INIT_RAM_22 = 256'h202D625B0D0A6C6774286465746E6320207472726E69656D202D745B0000676E;
	defparam prom_inst_0.INIT_RAM_23 = 256'h65207372746F000D656C6F747472206F61742064207474757470726569207474;
	defparam prom_inst_0.INIT_RAM_24 = 256'h7420696C6E65000D7269656D20676C626964000D2E676E6E0D0A0A646D6D206F;
	defparam prom_inst_0.INIT_RAM_25 = 256'h31300D0A6C62652071726E6F75620A646261642071726E6F7562000071727265;
	defparam prom_inst_0.INIT_RAM_26 = 256'h2C72616F6F6F6D6F20690A005D5669524B39615469770A0D0000444339383534;
	defparam prom_inst_0.INIT_RAM_27 = 256'h0000000000000000FFFF0078616F6F6F6F74782773650D0A7265726F676E6F6F;

	wire [15:0] prom_inst_1_dout_w;
	pROM prom_inst_1 (
		.DO({prom_inst_1_dout_w[15:0],dout[31:16]}),
		.CLK(clk),
        .OCE(oce),
        .CE(ce),
        .RESET(reset),
		.AD({ad[9:0], { 4{gw_gnd} } })
	);
	defparam prom_inst_1.READ_MODE = 1'b0;
	defparam prom_inst_1.BIT_WIDTH = 16;
	defparam prom_inst_1.RESET_MODE = "SYNC";
	defparam prom_inst_1.INIT_RAM_00 = 256'h00600050004000300000002000010020000100200000F80102010200000014C0;
	defparam prom_inst_1.INIT_RAM_01 = 256'h056005500540053005200510050002F002E002D002C002B002A0029002800070;
	defparam prom_inst_1.INIT_RAM_02 = 256'h00400201000000015B400000000007F007E007D007C007B007A0079007800570;
	defparam prom_inst_1.INIT_RAM_03 = 256'h03C003800340030002C002800240020001C001800140010000C0020100800201;
	defparam prom_inst_1.INIT_RAM_04 = 256'h07C007800740070006C006800640060005C005800540050004C0048004400400;
	defparam prom_inst_1.INIT_RAM_05 = 256'h0000000000000000000000000000000000000000400100000000040000010000;
	defparam prom_inst_1.INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam prom_inst_1.INIT_RAM_07 = 256'h0000FEC50045004700D5000700C5E8460000E2C5000099070000000000000000;
	defparam prom_inst_1.INIT_RAM_08 = 256'h000702000000008000C01BC0014002A002C0FEB50045000500B5E6450000E645;
	defparam prom_inst_1.INIT_RAM_09 = 256'h00E7FEF4020005C04E00DDC50000FE04FEF40030020100810011FE01000000A7;
	defparam prom_inst_1.INIT_RAM_0A = 256'h000000000201018101C10007020001C0FCF70780000702000007FEE4FFF7FEF4;
	defparam prom_inst_1.INIT_RAM_0B = 256'h00810011FF010000020101C1FE07FFF75637005402010081FE01F6DF4880D5D5;
	defparam prom_inst_1.INIT_RAM_0C = 256'h080702FA0607000000F704000647000000F7020006D700000017064700000101;
	defparam prom_inst_1.INIT_RAM_0D = 256'h000047C00007002006470000010100810011FF0100000101008100C100002E80;
	defparam prom_inst_1.INIT_RAM_0E = 256'h8B8700003980888700003A4086C70000010100810011FF0100000101008100C1;
	defparam prom_inst_1.INIT_RAM_0F = 256'h0200FE04FE04020100810011FE0100000101008100C1000038008F47000038C0;
	defparam prom_inst_1.INIT_RAM_10 = 256'h04E7FED40000FEF70FF0FED4FEF400070200EB5F338090C70000F89F00E71B10;
	defparam prom_inst_1.INIT_RAM_11 = 256'h0007FEF40B002DC0000700000B0006E7062000E706100CF7074002E70740FED4;
	defparam prom_inst_1.INIT_RAM_12 = 256'h0017FEF41740080702FA120000002AC09347000002400DC000002C4091C70000;
	defparam prom_inst_1.INIT_RAM_13 = 256'h0CC00140258096470000018008800140270094C700000007FEE405C0FEF40FF7;
	defparam prom_inst_1.INIT_RAM_14 = 256'h010100C1000001010081FF01EF9F000000E7FED402000140FEF40FF70017FEE4;
	defparam prom_inst_1.INIT_RAM_15 = 256'hFEA4020100810011FE010000020101C1000006070005FEA402010081FE010000;
	defparam prom_inst_1.INIT_RAM_16 = 256'h018101C10000F95F000705C7000004E7000000F705C70000000700F70010FEC4;
	defparam prom_inst_1.INIT_RAM_17 = 256'h000000F705C700000007FFF700F70010FEC4FEA4020100810011FE0100000201;
	defparam prom_inst_1.INIT_RAM_18 = 256'h0005FE04FCA403010281FD0100000201018101C10000F35F000705C7000004E7;
	defparam prom_inst_1.INIT_RAM_19 = 256'h05C70000FEB4FEA4020100810011FE010000030102C10007FEC4FEF400070A07;
	defparam prom_inst_1.INIT_RAM_1A = 256'h000700F70010FE84C49F00070017FE84EA9F000705C7000004E7000000F7FE84;
	defparam prom_inst_1.INIT_RAM_1B = 256'h000705C7000004E7000000F705C70000FFF7FE84E55F000700F70020FE84C99F;
	defparam prom_inst_1.INIT_RAM_1C = 256'h000000E7FEF40200FEF4000502010081FE0100000201018101C10007FEC4E45F;
	defparam prom_inst_1.INIT_RAM_1D = 256'h0007FEC400E702000007FEE40017FEC401C0FEA402010081FE010000020101C1;
	defparam prom_inst_1.INIT_RAM_1E = 256'hFEF4FFF7FEC40240FEF4FE04FCA403010281FD010000020101C100000000FE07;
	defparam prom_inst_1.INIT_RAM_1F = 256'h03010281FD010000030102C100000000FCF7FEC4FE0400E7020003070007FEC4;
	defparam prom_inst_1.INIT_RAM_20 = 256'h0200000700F797C7000000F700F7FDC4FEC40380FEF40027FFF7FD84FCB4FCA4;
	defparam prom_inst_1.INIT_RAM_21 = 256'h697472706373202D615B0000030102C100000000FC07FEC4FEF4FFC7FEC400E7;
	defparam prom_inst_1.INIT_RAM_22 = 256'h7562205D00002965676F20736C20756F6F747075657420726974205D00000D0A;
	defparam prom_inst_1.INIT_RAM_23 = 256'h68632D20656800000A2967672820617574206164656C75706F207572746E6E6F;
	defparam prom_inst_1.INIT_RAM_24 = 256'h6D69676E626100000A71207269746E69617300000A2E6E697572000D6E616F63;
	defparam prom_inst_1.INIT_RAM_25 = 256'h333200006465616E303269207474000D656C736930326920747400000D0A6920;
	defparam prom_inst_1.INIT_RAM_26 = 256'h6C2065646C7462207266680D0D0A63735B20676E206E6F470000464542413736;
	defparam prom_inst_1.INIT_RAM_27 = 256'h0000000000000000FFFF000000646C7462202027207372700000766566206970;

endmodule