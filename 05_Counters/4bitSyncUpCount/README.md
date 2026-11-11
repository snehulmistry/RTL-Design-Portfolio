# 4-bit Synchronous Up/Down Counter

A direction-controlled 4-bit binary counter implemented in SystemVerilog.

## RTL

- **Clock:** positive edge
- **Reset:** synchronous, active-high
- **Reset value:** `4'b0000`
- **Width:** 4 bits
- **Direction control:** `up_down`

| `up_down` | Operation |
|---:|---|
| 1 | Increment by one |
| 0 | Decrement by one |

Because the output is 4 bits wide, arithmetic wraps naturally: incrementing 15 returns 0, and decrementing 0 returns 15.

## Verification

The self-checking testbench checks reset, up-counting, down-counting, both rollover cases, direction switching, and reset during operation.

## Files

- `rtl.sv` — up/down counter RTL
- `tb.sv` — testbench

## Run

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```
