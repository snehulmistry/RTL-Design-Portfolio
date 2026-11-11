# 4-bit Johnson Counter

A 4-bit Johnson (twisted-ring) counter implemented using a shift-register structure with inverted feedback.

## RTL

- **Clock:** positive edge
- **Reset:** synchronous, active-high
- **Reset state:** `4'b0000`
- **Number of states:** 8

The next-state logic shifts the register left and feeds the inverted most significant bit into the least significant bit:

```systemverilog
count <= {count[2:0], ~count[3]};
```

Starting from reset, the expected sequence is:

```
0001 → 0011 → 0111 → 1111
  ↓
0000 ← 1000 ← 1100 ← 1110
```

## Verification

The self-checking testbench checks reset, all eight states in sequence, rollover, and reset during operation.

## Files

- `rtl.sv` — Johnson counter RTL
- `tb.sv` — self-checking testbench

## Run

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```
