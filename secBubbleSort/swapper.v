
module swapper#(parameter width = 8)
(
	input								  en,
	input 				          clk,
	input					          rst,
	input 		     [width-1:0]  a,
	input 			  [width-1:0]  b, 
	output reg  [width-1:0] largest,
   output reg  [width-1:0] smallest
	
);

always@(posedge clk,negedge rst) 
begin 
	if(!rst) 
		begin 
			largest <= 0; 
			smallest <= 0;
		end
	else if(en)
		begin 
			if(a >= b)
				begin
					largest  <= a; 
					smallest <= b; 
				end
			else 
				begin 
					largest  <= b; 
					smallest <= a;			
				end	
		end
	else 
		begin 
			largest <= largest;
			smallest <= smallest;
		end
end
endmodule