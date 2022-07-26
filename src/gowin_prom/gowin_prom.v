//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.05
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9C
//Created Time: Sun Jul 24 00:13:59 2022

module Gowin_pROM (dout, clk, oce, ce, reset, ad);

output [31:0] dout;
input clk;
input oce;
input ce;
input reset;
input [9:0] ad;

wire [15:0] prom_inst_0_dout_w;
wire [15:0] prom_inst_1_dout_w;
wire gw_gnd;

assign gw_gnd = 1'b0;

pROM prom_inst_0 (
    .DO({prom_inst_0_dout_w[15:0],dout[15:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .AD({ad[9:0],gw_gnd,gw_gnd,gw_gnd,gw_gnd})
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
defparam prom_inst_0.INIT_RAM_0E = 256'h8067011324032083001300EF851317B704132423262301138067011324032083;
defparam prom_inst_0.INIT_RAM_0F = 256'hF0EF00EF051300EF00EF0513F0EFA423071347B7072307A304132C232E230113;
defparam prom_inst_0.INIT_RAM_10 = 256'h006F00EF851327B71A63079347038C23470327B706E30793470306A3A78347B7;
defparam prom_inst_0.INIT_RAM_11 = 256'h262304132E2301138067011324030013041326230113F06F0013A023470347B7;
defparam prom_inst_0.INIT_RAM_12 = 256'h27B7871317B307132783262304132C232E2301138067011324030013678B0713;
defparam prom_inst_0.INIT_RAM_13 = 256'h2C232E23011380670113240320830013F0EF8513A78327B7AE2327B76733A783;
defparam prom_inst_0.INIT_RAM_14 = 256'hF0EF8513A78327B7AE2327B77733A78327B78713C79317B30713278326230413;
defparam prom_inst_0.INIT_RAM_15 = 256'h8513278326238793078B071326232E2304132623011380670113240320830013;
defparam prom_inst_0.INIT_RAM_16 = 256'h27B7AE2327B767332783A70327B72423262304132C232E230113806701132403;
defparam prom_inst_0.INIT_RAM_17 = 256'h846377B307B72703F0EF846377B307B72703F0EF8463F7932783F0EF8513A783;
defparam prom_inst_0.INIT_RAM_18 = 256'h2403208385132783F0EF8513A78327B7AE2327B77733A78327B7C7132783F0EF;
defparam prom_inst_0.INIT_RAM_19 = 256'h2E2301138067011324030013A023470347B707A3079304132E23011380670113;
defparam prom_inst_0.INIT_RAM_1A = 256'h011324030013001390E3C7832783A02347B7C703262387132783006F26230413;
defparam prom_inst_0.INIT_RAM_1B = 256'hA02347B78713C7832783262387932783006F262307932E230413262301138067;
defparam prom_inst_0.INIT_RAM_1C = 256'h9793879327832C232E23041326230113806701132403001300131CE327030793;
defparam prom_inst_0.INIT_RAM_1D = 256'h2783262387932783A02347B7C70307B307131737F79357B327032783006F2623;
defparam prom_inst_0.INIT_RAM_1E = 256'h16238793172307138693079304132C232E23011380670113240300130013D4E3;
defparam prom_inst_0.INIT_RAM_1F = 256'h011324032083001300EF8513578300EF85130593578357035603568315230793;
defparam prom_inst_0.INIT_RAM_20 = 256'h578326231C2307931D2307931E2387931F238713079304132423262301138067;
defparam prom_inst_0.INIT_RAM_21 = 256'h27835713971387B35703D79397932783006F2023222307B30713979357832423;
defparam prom_inst_0.INIT_RAM_22 = 256'h87B35703D79397932783F0EF0513859386135683D793979387B35683D7939793;
defparam prom_inst_0.INIT_RAM_23 = 256'h97932783F0EF0513859386135683D793979387B35683D7939793278357139713;
defparam prom_inst_0.INIT_RAM_24 = 256'h0513859386135683D793979387B35683D793979327835713971307B35703D793;
defparam prom_inst_0.INIT_RAM_25 = 256'h5683D793979387B35683D793979327835713971307B35703D79397932783F0EF;
defparam prom_inst_0.INIT_RAM_26 = 256'h8793278346632783DA63278320238793979307B327832703F0EF051385938613;
defparam prom_inst_0.INIT_RAM_27 = 256'h5C63278320238793979307B327832703006F222307B327038793979327832623;
defparam prom_inst_0.INIT_RAM_28 = 256'h262387932783006F222307B3270307B307139793278324238793278358632783;
defparam prom_inst_0.INIT_RAM_29 = 256'h2403208300130013DAE32783242387932783222307B32703979307B327832703;
defparam prom_inst_0.INIT_RAM_2A = 256'h00EF051300EF051300EF051300EF051300EF0513041324232623011380670113;
defparam prom_inst_0.INIT_RAM_2B = 256'h00EF051300EF051300EF051300EF051300EF051300EF051300EF051300EF0513;
defparam prom_inst_0.INIT_RAM_2C = 256'h00EF051300EF051300EF051300EF051300EF051300EF051300EF051300EF0513;
defparam prom_inst_0.INIT_RAM_2D = 256'h00EF051300EF051300EF051300EF051300EF051300EF051300EF051300EF0513;
defparam prom_inst_0.INIT_RAM_2E = 256'h00EF051300EF051300EF051300EF051300EF051300EF051300EF051300EF0513;
defparam prom_inst_0.INIT_RAM_2F = 256'h00EF051300EF051300EF051300EF051300EF051300EF051300EF051300EF0513;
defparam prom_inst_0.INIT_RAM_30 = 256'h00EF051300EF051300EF051300EF051300EF051300EF051300EF051300EF0513;
defparam prom_inst_0.INIT_RAM_31 = 256'h8713079304132C232E2301138067011324032083001300EF0513059306130693;
defparam prom_inst_0.INIT_RAM_32 = 256'h073357835703E86307935703EE63079357031423079315230793162387931723;
defparam prom_inst_0.INIT_RAM_33 = 256'h578300EF8513D79397938793578300EF0513CC630793073357835703C2630793;
defparam prom_inst_0.INIT_RAM_34 = 256'hD79397938793578300EF051300EF8513D79397938793D793979307B357838713;
defparam prom_inst_0.INIT_RAM_35 = 256'h006F00EF051300EF8513D79397938793D793979307B357838713578300EF8513;
defparam prom_inst_0.INIT_RAM_36 = 256'h06931F230793041324232623011380670113240320830013006F0013006F0013;
defparam prom_inst_0.INIT_RAM_37 = 256'h1EE3879387B7570317238793578300EF85135783006F1723F0EF051305930613;
defparam prom_inst_0.INIT_RAM_38 = 256'h00EF05138863478307A3079304132C232E230113806701132403208300130013;
defparam prom_inst_0.INIT_RAM_39 = 256'h8863478307A3079304132C232E2301138067011324032083001300EF0513006F;
defparam prom_inst_0.INIT_RAM_3A = 256'hC7B707A3079304132E2301138067011324032083001300EF0513006F00EF0513;
defparam prom_inst_0.INIT_RAM_3B = 256'h0013A02347038793C7B707A3079304132E2301138067011324030013A0234703;
defparam prom_inst_0.INIT_RAM_3C = 256'h77138793C7B78713D7939793D79357831723079304132E230113806701132403;
defparam prom_inst_0.INIT_RAM_3D = 256'h676E6E6920766972205D0D0A8067011324030013A02377138793C7B75703A023;
defparam prom_inst_0.INIT_RAM_3E = 256'h6F6F6D6F20690A005D5669524B39615469770A0D000044433938353431300000;
defparam prom_inst_0.INIT_RAM_3F = 256'h00000000FFFF0078616F6F6F6F74782773650D0A7265726F676E6F6F2C72616F;

pROM prom_inst_1 (
    .DO({prom_inst_1_dout_w[15:0],dout[31:16]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .AD({ad[9:0],gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);

defparam prom_inst_1.READ_MODE = 1'b0;
defparam prom_inst_1.BIT_WIDTH = 16;
defparam prom_inst_1.RESET_MODE = "SYNC";
defparam prom_inst_1.INIT_RAM_00 = 256'h00600050004000300000002000010020000100200000F80102010200000014C0;
defparam prom_inst_1.INIT_RAM_01 = 256'h056005500540053005200510050002F002E002D002C002B002A0029002800070;
defparam prom_inst_1.INIT_RAM_02 = 256'h00400201000000014E000000000007F007E007D007C007B007A0079007800570;
defparam prom_inst_1.INIT_RAM_03 = 256'h03C003800340030002C002800240020001C001800140010000C0020100800201;
defparam prom_inst_1.INIT_RAM_04 = 256'h07C007800740070006C006800640060005C005800540050004C0048004400400;
defparam prom_inst_1.INIT_RAM_05 = 256'h0000000000000000000000000000000000000000400100000000040000010000;
defparam prom_inst_1.INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam prom_inst_1.INIT_RAM_07 = 256'h0000FEC50045004700D5000700C5E8460000E2C50000F9870000000000000000;
defparam prom_inst_1.INIT_RAM_08 = 256'h000702000000008000C01980014002A002C0FEB50045000500B5E6450000E645;
defparam prom_inst_1.INIT_RAM_09 = 256'h00E7FEF4020005C040C0DDC50000FE04FEF40030020100810011FE01000000A7;
defparam prom_inst_1.INIT_RAM_0A = 256'h000000000201018101C10007020001C0FCF70780000702000007FEE4FFF7FEF4;
defparam prom_inst_1.INIT_RAM_0B = 256'h00810011FF010000020101C1FE07FFF75637005402010081FE01F6DF3B40D5D5;
defparam prom_inst_1.INIT_RAM_0C = 256'h080702FA0607000000F704000647000000F7020006D700000017064700000101;
defparam prom_inst_1.INIT_RAM_0D = 256'h00003A800007002006470000010100810011FF0100000101008100C100002140;
defparam prom_inst_1.INIT_RAM_0E = 256'h00000101008100C100002D00F6870000010100810011FF0100000101008100C1;
defparam prom_inst_1.INIT_RAM_0F = 256'hED1F1AD0000069802BD00110FADF00E71B100200FE04FE04020100810011FE01;
defparam prom_inst_1.INIT_RAM_10 = 256'h014024000007000000F70610FED404E7FED40000FEF70FF0FED4FEF400070200;
defparam prom_inst_1.INIT_RAM_11 = 256'hFEA402010081FE010000010100C1000001010081FF01FB1F000000E7FED40200;
defparam prom_inst_1.INIT_RAM_12 = 256'h0000000700F70010FEC4FEA4020100810011FE010000020101C1000006070005;
defparam prom_inst_1.INIT_RAM_13 = 256'h00810011FE0100000201018101C10000F95F000705C7000004E7000000F705C7;
defparam prom_inst_1.INIT_RAM_14 = 256'hF35F000705C7000004E7000000F705C700000007FFF700F70010FEC4FEA40201;
defparam prom_inst_1.INIT_RAM_15 = 256'h0007FEC4FEF400070A070005FE04FCA403010281FD0100000201018101C10000;
defparam prom_inst_1.INIT_RAM_16 = 256'h000004E7000000F7FE8405C70000FEB4FEA4020100810011FE010000030102C1;
defparam prom_inst_1.INIT_RAM_17 = 256'h000700F70020FE84D6DF000700F70010FE84D1DF00070017FE84EA9F000705C7;
defparam prom_inst_1.INIT_RAM_18 = 256'h018101C10007FEC4E45F000705C7000004E7000000F705C70000FFF7FE84E55F;
defparam prom_inst_1.INIT_RAM_19 = 256'h0081FE010000020101C1000000E7FEF40200FEF4000502010081FE0100000201;
defparam prom_inst_1.INIT_RAM_1A = 256'h020101C100000000FE070007FEC400E702000007FEE40017FEC401C0FEA40201;
defparam prom_inst_1.INIT_RAM_1B = 256'h00E7020003070007FEC4FEF4FFF7FEC40240FEF4FE04FCA403010281FD010000;
defparam prom_inst_1.INIT_RAM_1C = 256'h0027FFF7FD84FCB4FCA403010281FD010000030102C100000000FCF7FEC4FE04;
defparam prom_inst_1.INIT_RAM_1D = 256'hFEC4FEF4FFC7FEC400E70200000700F7F847000000F700F7FDC4FEC40380FEF4;
defparam prom_inst_1.INIT_RAM_1E = 256'hFEF40006FEF4000600050005020100810011FE010000030102C100000000FC07;
defparam prom_inst_1.INIT_RAM_1F = 256'h0201018101C1000072000007FEA4488000070007FEE4FEC4FEE4FEC4FEF40007;
defparam prom_inst_1.INIT_RAM_20 = 256'hFDA4FE04FCF40007FCF40006FCF40005FCF400060005030102810211FD010000;
defparam prom_inst_1.INIT_RAM_21 = 256'hFE840107010700E7FDE401070107FEC420C0FE04FEF440F700100017FDA4FEF4;
defparam prom_inst_1.INIT_RAM_22 = 256'h00E7FDE401070107FEC4EF1F000700070006FD840107010700D7FDC401070107;
defparam prom_inst_1.INIT_RAM_23 = 256'h0107FEC4EA5F000700070006FD840107010740F6FDC401070107FE8401070107;
defparam prom_inst_1.INIT_RAM_24 = 256'h000700070006FD840107010700D7FDC401070107FE840107010740F7FDE40107;
defparam prom_inst_1.INIT_RAM_25 = 256'hFD840107010740F6FDC401070107FE840107010740F7FDE401070107FEC4E59F;
defparam prom_inst_1.INIT_RAM_26 = 256'h0017FEC402F0FE040207FE44FEF4FFF7001700F7FE84FE44E0DF000700070006;
defparam prom_inst_1.INIT_RAM_27 = 256'h02F0FE44FEF4FFF7001740F7FEC4FE4408C0FEF400F7FE4400170017FEC4FEF4;
defparam prom_inst_1.INIT_RAM_28 = 256'hFEF40017FEC40380FEF400F7FE4440F700100017FE84FEF4FFF7FE8402F0FE04;
defparam prom_inst_1.INIT_RAM_29 = 256'h028102C100000000DE07FE84FEF4FFF7FE84FEF400F7FE44001740F7FE84FEC4;
defparam prom_inst_1.INIT_RAM_2A = 256'h3EC00B20424000503FC003A04340070040C00360010100810011FF0100000301;
defparam prom_inst_1.INIT_RAM_2B = 256'h3AC00BB03E4003503BC00B703F4003303FC003304040000040C000C0414000C0;
defparam prom_inst_1.INIT_RAM_2C = 256'h39C0012037400C303AC00FF03B40001038C00C203C4002C039C00C003D400190;
defparam prom_inst_1.INIT_RAM_2D = 256'h35C003F0364002B036C001303740011037C000D03840004038C00D0036400E00;
defparam prom_inst_1.INIT_RAM_2E = 256'h2EC00E103240023032C001F0334000B033C000D03440018034C004C035400540;
defparam prom_inst_1.INIT_RAM_2F = 256'h2DC004402E4003F02EC002C02F4001302FC00110304000C030C0004031400D00;
defparam prom_inst_1.INIT_RAM_30 = 256'h26C00290274002102AC002302B4002002BC001F02C4001F02CC002F02D400510;
defparam prom_inst_1.INIT_RAM_31 = 256'h00060005020100810011FE0100000101008100C100000180000000000F000870;
defparam prom_inst_1.INIT_RAM_32 = 256'h00F7FEA4FEE40CE70860FEC40CE70EF0FEE4FEF40007FEF40006FEF40005FEF4;
defparam prom_inst_1.INIT_RAM_33 = 256'hFEE421400007010701070287FEE41C8002A00AE7087000F7FE84FEC40CE70F00;
defparam prom_inst_1.INIT_RAM_34 = 256'h010701070357FEC417C002B01E8000070107010702770107010700F7FEA40007;
defparam prom_inst_1.INIT_RAM_35 = 256'h0180130002C019C000070107010703470107010700F7FE840007FEC41C800007;
defparam prom_inst_1.INIT_RAM_36 = 256'h0870FCF40005030102810211FD0100000201018101C100000080000001000000;
defparam prom_inst_1.INIT_RAM_37 = 256'hFCF7E9070000FEE4FEF40017FEE412C00007FDE401C0FE04E9DF000000000F00;
defparam prom_inst_1.INIT_RAM_38 = 256'h06C002900007FEF4FEF40005020100810011FE0100000301028102C100000000;
defparam prom_inst_1.INIT_RAM_39 = 256'h0007FEF4FEF40005020100810011FE0100000201018101C100000600028000C0;
defparam prom_inst_1.INIT_RAM_3A = 256'h0200FEF4000502010081FE0100000201018101C100000180011000C002400100;
defparam prom_inst_1.INIT_RAM_3B = 256'h000000E7FEF400870200FEF4000502010081FE010000020101C1000000E7FEF4;
defparam prom_inst_1.INIT_RAM_3C = 256'h0FF7008702000007010701070087FEE4FEF4000502010081FE010000020101C1;
defparam prom_inst_1.INIT_RAM_3D = 256'h0D0A697472706373202D615B0000020101C1000000E70FF700870200FEE400E7;
defparam prom_inst_1.INIT_RAM_3E = 256'h6C7462207266680D0D0A63735B20676E206E6F47000046454241373633320000;
defparam prom_inst_1.INIT_RAM_3F = 256'h00000000FFFF000000646C74622020272073727000007665662069706C206564;

endmodule //Gowin_pROM