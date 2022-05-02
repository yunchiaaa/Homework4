module BCD_tb;
  reg clk_tb;
  reg rst_asyn_tb;
  BCD BCD_1(.clk(clk_tb),.rst_asyn(rst_asyn_tb));
initial begin                //設定clock和reset初始值
  clk_tb=0'b0;
  rst_asyn_tb=0'b0;
end
always begin                //clock變動頻率
  #5 clk_tb=~clk_tb;
end
initial begin               //設定reset變化時間
  #20 rst_asyn_tb=0'b0;
  #10 rst_asyn_tb=1'b1;
  #10 rst_asyn_tb=0'b0;
  #150 $finish;             //20+10+10+150是輸出結果的時長
end
initial begin               //輸出結果
  $dumpfile("BCD.vcd");
  $dumpvars(0,BCD_1);
end
endmodule
