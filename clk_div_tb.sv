
module clk_div_top;
  reg clk;
  reg rst;
  wire clk_d;

  clk_div u_dut(.clk(clk),
                .rst(rst),
                .clk_d(clk_d)
               );

  initial begin
    clk = 1;
    forever #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    #2;
    rst = 0;
    #100;
    $finish;
  end

  initial begin
    $dumpwave("dump.vcd");
    $dumpvars(1);
  end
  
endmodule
