# 4-bit Synchronous Down Counter

A 4-bit binary down counter implemented in SystemVerilog.

## RTL

- **Clock:** positive edge
- **Reset:** synchronous, active-high
- **Reset value:** `4'b1111`
- **Width:** 4 bits
- **Count sequence:** 15 down to 0, then rollover to 15

The counter decrements by one on each rising clock edge when reset is inactive.

## Verification

The self-checking testbench verifies:
- Reset to fifteen
- Descending count sequence
- Rollover from `4'b0000` to `4'b1111`

## Files

- `rtl.sv` — counter RTL
- `tb.sv` — testbench

## Run

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```
