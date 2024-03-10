/*Design a synchronous logic control unit for Vending machine and verify using test bench. Verilog Code for Vending Machine that can
take only two types of coins of denomination 1 and 2 in any order. It delivers only one product that is priced Rs. 3. On receiving Rs. 3 
the product is delivered by asserting an output X=1 which otherwise remains 0. If it gets Rs. 4 then the product is delivered by asserting X
and also a coin return mechanism is activated by output Y = 1to return a Re. 1 coin. There are two sensors to sense the
denomination of the coins that give binary output as shown in the following table. The clock speed is much higher than human
response time i.e., no two coins can be deposited in same clock cycle */

module vending(i,j,clk,rst,x,y);
input i,j,clk,rst; output reg x,y;
parameter
s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0]ns,ps;
always@(posedge clk)
begin
if(rst)
ps<=s0;
else ps<=ns;
end
always@(*) begin
ns=s0; case(ps)
s0:begin
if({i,j}==2'b0x)
begin
ns=s0;
{x,y}=2'b00;
end
else if({i,j}==2'b10)
begin
ns=s1;
{x,y}=2'b00;
end
else begin
ns=s2;
{x,y}=2'b00; end
end s1:begin
if({i,j}==2'b0x)
begin
ns=s1;
{x,y}=2'b00;
end
else if({i,j}==2'b10)
begin
ns=s2;
{x,y}=2'b00;
end
else
begin
ns=s0;
{x,y}=2'b10; end
end
s2:begin
if({i,j}==2'b0x)
begin
ns=s2;
{x,y}=2'b00;
end
else if({i,j}==2'b10)
begin
ns=s0;
{x,y}=2'b10; end
else begin
ns=s0; {x,y}=2'b11;
end
end
endcase
end
endmodule
