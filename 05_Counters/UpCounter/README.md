# 4-bit Synchronous Up Counter

A 4-bit binary up counter implemented in SystemVerilog.

## RTL

- **Clock:** positive edge
- **Reset:** synchronous, active-high
- **Reset value:** `4'b0000`
- **Width:** 4 bits
- **Count sequence:** 0 to 15, then rollover to 0

The counter increments by one on each rising clock edge when reset is inactive.

## Verification

The self-checking testbench verifies:
- Reset to zero
- The complete 16-state counting sequence
- Rollover from `4'b1111` to `4'b0000`

## Files

- `rtl.sv` — counter RTL
- `tb.sv` — self-checking testbench

## Run

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```
