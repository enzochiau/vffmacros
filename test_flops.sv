// D flip-flop w/ async reset_n
`define DFF_ARN(q, d, clk, rst_n) \
always_ff @(posedge clk, negedge rst_n) begin \
    if (!rst_n) q <= '0; \
    else        q <= (d); \
end

// D flip-flop w/ async reset_n
module dff_arn #(type T = logic [7:0])
(
    input logic clk,
    input logic rst_n,

    output T q,
    input  T d
 );

    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) q <= T'(0);
        else        q <= d;
    end

endmodule: dff_arn

module test_flops();

    // parameter int N = 10000;
    parameter int N = 1000;

    logic         clk = 1'b0;
    logic         rst_n = 1'b1;
    logic [31:0]  flops [N];

    // *** Substitute flip-flop instances here ***
    // Method #1: Use flop macros
    // generate
    //     for (genvar gi = 1; gi < N; ++gi) begin : method1_macro
    //         `DFF_ARN(flops[gi], flops[gi-1], clk, rst_n)
    //     end
    // endgenerate

    // Method #2: Use flop module instances
    generate
       for (genvar gi = 1; gi < N; ++gi) begin : method2_module
           dff_arn #(logic [31:0]) INST (.*, .q(flops[gi]), .d(flops[gi-1]));
       end
    endgenerate

    always #10 clk = ~clk;

    initial begin
        // Reset sequence
        rst_n = 1'b0;
        #100;
        rst_n = 1'b1;

        for (int i = 0; i < 10000; ++i) begin
            flops[0] = $random();
            @(posedge clk) #1;
        end

        $finish();
    end // initial begin

endmodule: test_flops
