//101-sequence detector
module seq101de(din,clk,rst,dout);
input din,clk,rst;
output reg dout;
parameter s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0]ns,ps;
//present state
always@(posedge clk)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end
//next state
always@(*)
begin ns=s0;
case(ps)
s0:begin
if(din)
begin
ns=s1;
dout=1'b0;
end
else begin
ns=s0;
dout=1'b0;
end
end s1:begin
if(din)
begin ns=s1;
dout=1'b0;
end else
begin ns=s2;
dout=1'b0;
end
end
s2:begin
if(din) begin
ns=s1;
dout=1'b1;
end else
begin
ns=s0;
dout=1'b0;
end
end
default:ns=s0;
endcase
end
endmodule
