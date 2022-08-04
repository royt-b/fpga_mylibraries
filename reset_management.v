//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/04 10:25:50
// Design Name: 
// Module Name: reset_management
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//延时启动管理
//延时时长delay ，相对于clk
module reset_management(
       input wire [25:0] delay,
       input wire locked,
       input wire clk,
       output reg rst_n
);
reg [25:0] cnt;

always @ (posedge clk)
begin
  if (!locked)
	begin
		cnt <= 26'd0;
	end
	else
	begin
		if (cnt >= delay)
		begin
			cnt <= delay;
		end
		else
		begin
			cnt <= cnt + 26'd1;
		end
	end
end


always @ (posedge clk)
begin
	if (cnt >= delay)
	   rst_n <= 1'b1;
	else
	   rst_n <= 1'b0;
end
endmodule


