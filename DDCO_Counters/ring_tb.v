module tb_ring;

    // Inputs
    reg Clock;
    reg Reset;

    // Outputs
    wire [3:0] Count_out;

    // Instantiate the Unit Under Test (UUT)
    ring_counter uut (
        .Clock(Clock), 
        .Reset(Reset), 
        .Count_out(Count_out)
    );

    ///////////////////Clock generation ///////////////////////////
    initial Clock = 0; 
    always #10 Clock = ~Clock; 
    ////////// #10 means wait for 10 ns before executing the next statement. ///////////
    
    //Simulation inputs.
    initial begin
    //Apply Reset for 50 ns.
        Reset = 1; //Reset is high
        #10;       //Wait for 50 ns
        Reset = 0; //Reset is low.
        #150 $finish;
    end
        initial begin
          $monitor($time, " clock=%1b,reset=%1b,q=%4b",Clock,Reset,Count_out);
		end
		initial begin $dumpfile("tb_ringtest.vcd"); $dumpvars(0, tb_ring); end
      
endmodule
