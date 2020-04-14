// 姓名: 胡詔宸
// 學號: 0713407

`timescale 1ns/1ps

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               );

    input         src1;
    input         src2;
    input         less;
    input         A_invert;
    input         B_invert;
    input         cin;
    input [2-1:0] operation;

    output        result;
    output        cout;

    reg           result;

    wire r0, r1, r2, r3;
    wire tmp1, tmp2;

    assign tmp1 = A_invert ? ~src1 : src1;
    assign tmp2 = B_invert ? ~src2 : src2;
    assign {cout,r2} = tmp1 + tmp2 + cin;

    and g1(r0, tmp1, tmp2);
    or  g2(r1, tmp1, tmp2);

    always@(*) begin
        case(operation)
            0: result = r0;
            1: result = r1;
            2: result = r2;
            3: result = less;
        endcase
    end

endmodule