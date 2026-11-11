# 4:2 Priority Encoder

## Overview

A 4:2 Priority Encoder designed and verified using Verilog HDL.

Unlike a conventional encoder, a priority encoder can handle multiple active inputs by assigning priority to the highest-order input.

The priority order used in this design is:

```text
D[3] > D[2] > D[1] > D[0]
```

If multiple inputs are HIGH, the highest-priority active input is encoded at the output.

## Truth Table

| D3 | D2 | D1 | D0 | Y1 | Y0 |
|----|----|----|----|----|----|
| 0  | 0  | 0  | 0  | 0  | 0  |
| 0  | 0  | 0  | 1  | 0  | 0  |
| 0  | 0  | 1  | X  | 0  | 1  |
| 0  | 1  | X  | X  | 1  | 0  |
| 1  | X  | X  | X  | 1  | 1  |

`X` represents a don't-care condition because lower-priority inputs are ignored when a higher-priority input is active.

## Boolean Logic

The Boolean expressions for the outputs are:

```text
Y1 = D3 + D2

Y0 = D3 + (~D2 · D1)
```

These expressions were derived using Boolean logic and K-map simplification.

## RTL Implementation

The design is implemented using continuous assignments in Verilog HDL.

```verilog
module Priencoder (

    input [3:0] D,

    output [1:0] Y

);

assign Y[1] = D[3] | D[2];

assign Y[0] = D[3] | (~D[2] & D[1]);

endmodule
```

## Simulation Waveform

The RTL was simulated using Icarus Verilog and the generated VCD waveform was analyzed using Surfer.

The waveform verifies that the highest-priority active input is correctly encoded.


![Priority Encoder Waveform] (Priencoder_waveform.png)

### Observed Output

| Input D | Output Y | Selected Input |
|---------|----------|----------------|
| `0000`  | `00`     | None |
| `0001`  | `00`     | D0 |
| `0010`  | `01`     | D1 |
| `0011`  | `01`     | D1 |
| `0100`  | `10`     | D2 |
| `0110`  | `10`     | D2 |
| `0111`  | `10`     | D2 |
| `1000`  | `11`     | D3 |
| `1011`  | `11`     | D3 |
| `1111`  | `11`     | D3 |

Multiple-input cases were specifically included to verify priority behavior.

## Testbench

The testbench applies a range of input combinations, including cases where multiple inputs are simultaneously HIGH.

```verilog
`timescale 1ns/1ps

module Priencoder_tb;

reg  [3:0] D;
wire [1:0] Y;

Priencoder dut (
    .D(D),
    .Y(Y)
);

initial begin

    $dumpfile("Priencoder.vcd");
    $dumpvars(0, Priencoder_tb);

    D = 4'b0000; #10;
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0011; #10;
    D = 4'b0100; #10;
    D = 4'b0110; #10;
    D = 4'b0111; #10;
    D = 4'b1000; #10;
    D = 4'b1011; #10;
    D = 4'b1111; #10;

    $finish;

end

endmodule
```

## Project Structure

```text
PriorityEncoder/
│
├── Priencoder.v
├── Priencoder_tb.v
├── Priencoder.vcd
└── README.md
```

## Tools Used

- Verilog HDL
- Icarus Verilog — RTL simulation
- Surfer — waveform analysis

## Learning Outcomes

This project helped reinforce:

- Priority encoder operation
- Combinational logic design
- Boolean expression derivation
- K-map simplification
- Verilog continuous assignments
- Testbench development
- VCD waveform generation
- RTL simulation and functional verification

## Next Project

**1:4 Demultiplexer**

The next project will continue the progression through fundamental combinational digital logic and Verilog RTL design.
