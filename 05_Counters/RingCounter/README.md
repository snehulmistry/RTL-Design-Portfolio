# 4-bit Ring Counter

A 4-bit ring counter that circulates a single logic-high bit through a shift-register-style structure.

## RTL

- **Clock:** positive edge
- **Reset:** synchronous, active-high
- **Reset state:** `4'b0001`
- **Sequence:** `0001 → 0010 → 0100 → 1000 → 0001`

The most significant bit is fed back to the least significant bit on every active clock edge.

## Verification

The testbench checks the reset state, each state in the four-step ring sequence, rollover to the initial state, and reset during operation.

## Files

- `rtl.sv` — ring counter RTL
- `tb.sv` — self-checking testbench

## Run

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```
