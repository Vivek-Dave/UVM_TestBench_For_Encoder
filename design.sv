// 8x3 encoder verilog design

module encoder_8x3(in,
                   out
                   );
    input [7:0]in;       // input lines
    output reg [2:0]out; // ooutput lines 

    always@(in)
        begin
            case(in)
                8'b0000_0001:out=3'b000;
                8'b0000_0010:out=3'b001;
                8'b0000_0100:out=3'b010;
                8'b0000_1000:out=3'b011;
                8'b0001_0000:out=3'b100;
                8'b0010_0000:out=3'b101;
                8'b0100_0000:out=3'b110;
                8'b1000_0000:out=3'b111;
                default:out=3'bxxx;
            endcase
        end

endmodule