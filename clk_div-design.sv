module clk_div(
  input clk,
  input rst,
  output clk_d
);

  reg [2:0] div_cnt;

  always @(posedge clk) begin
    if(rst)
      div_cnt <= 3'b0;
    else
      div_cnt <= div_cnt + 1;
  end

  assign clk_d = div_cnt[1]; // clk_d frequency = 1/2 * clk frequency
  //assign clk_d = div_cnt[2]; // clk_d frequency = 1/3 * clk frequency

endmodule

/*                                                   div_cnt values         clk_d values       clk values 
rst = 1 => div_cnt = 000                                  000         clk_d = div_cnt[1] = 0 ;   clk = 0
rts = 0 => div_cnt = div_cnt + 1 always @(posedge clk)    001         clk_d = div_cnt[1] = 0 ;   clk = 1
                                                          010         clk_d = div_cnt[1] = 1 ;   clk = 0
                                                          011         clk_d = div_cnt[1] = 1 ;   clk = 1
                                                          100         clk_d = div_cnt[1] = 0 ;   clk = 0
                                                          101         clk_d = div_cnt[1] = 0 ;   clk = 1
                                                          110         clk_d = div_cnt[1] = 1 ;   clk = 0
                                                          111         clk_d = div_cnt[1] = 1 ;   clk = 1
                                                       so clk_d frequency is halfed that of clk frequnecy
*/
