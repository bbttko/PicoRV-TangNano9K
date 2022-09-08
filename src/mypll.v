/*
 * file referenced from IP Core Generator
 *
 * - btko 8 Sept 22
 */
module mypll (
        output wire clkout,
        output wire lock,
        input wire reset,
        input wire clkin
    );

    wire clkoutp_o;
    wire clkoutd_o;
    wire clkoutd3_o;
    wire gw_gnd;

    assign gw_gnd = 1'b0;


    rPLL #(
        .FCLKIN     ("27"),
        .DYN_IDIV_SEL("false"),
        .IDIV_SEL   (6),
        .DYN_FBDIV_SEL("false"),
        .FBDIV_SEL  (12),
        .DYN_ODIV_SEL("false"),
        .ODIV_SEL   (8),
        .PSDA_SEL   ("0000"),
        .DYN_DA_EN  ("false"),
        .DUTYDA_SEL ("1000"),
        .CLKOUT_FT_DIR  (1'b1),
        .CLKOUTP_FT_DIR (1'b1),
        .CLKOUT_DLY_STEP(0),
        .CLKOUTP_DLY_STEP(0),
        .CLKFB_SEL  ("internal"),
        .CLKOUT_BYPASS  ("false"),
        .CLKOUTP_BYPASS ("false"),
        .CLKOUTD_BYPASS ("false"),
        .DYN_SDIV_SEL   (2),
        .CLKOUTD_SRC    ("CLKOUT"),
        .CLKOUTD3_SRC   ("CLKOUT"),
        .DEVICE         ("GW1NR-9C")
    ) rpll_inst (
        .CLKOUT(clkout),
        .LOCK(lock),
        .CLKOUTP(clkoutp_o),
        .CLKOUTD(clkoutd_o),
        .CLKOUTD3(clkoutd3_o),
        .RESET(reset),
        .RESET_P(gw_gnd),
        .CLKIN(clkin),
        .CLKFB(gw_gnd),
        .FBDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
        .IDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
        .ODSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
        .PSDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
        .DUTYDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
        .FDLY({gw_gnd,gw_gnd,gw_gnd,gw_gnd})
    );
endmodule