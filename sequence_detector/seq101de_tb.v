module seq101de_tb();
reg din,clk,rst;
wire dout;
seq101de dut(din,clk,rst,dout);
initial
begin clk=1'b0;
forever
#5 clk=~clk; end
task initialize;
begin din=1'b0;
rst=1'b1;
end
endtask
task reset; begin
@(negedge clk) rst=1'b1; @(negedge clk)
rst=1'b0; end
endtask
task inputs(input m);
@(negedge clk) din=m;
endtask
initial
begin
initialize; reset;
inputs(1);
inputs(0); inputs(1);
inputs(0); inputs(1);
inputs(1);
inputs(0); inputs(1);
$finish(); end
endmodule 
