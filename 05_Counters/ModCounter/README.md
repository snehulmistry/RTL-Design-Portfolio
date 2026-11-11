# Configurable Modulo-N Counter

A parameterized synchronous modulo counter written in SystemVerilog.

## Parameters

| Parameter | Default | Description |
|---|---:|---|
| `N` | 10 | Modulo value; the counter cycles through 0 to N−1 |
| `WIDTH` | 4 | Width of the counter output |

## RTL

- **Clock:** positive edge
- **Reset:** synchronous, active-high
- **Reset value:** 0
- **Count sequence (default):** 0 → 1 → … → 9 → 0

When the current count reaches `N-1`, the next clock edge clears it to zero. Otherwise, the count increments.

## Example instantiation

```systemverilog
rtl #(
    .N(10),
    .WIDTH(4)
) DUT (
    .clk(clk),
    .rst(rst),
    .count(count)
);
```

Choose `WIDTH` large enough to represent every value from 0 through N−1.

## Verification

The testbench configures N=10 and WIDTH=4. It checks reset and twenty consecutive count updates, covering two complete modulo-10 cycles.

## Files

- `rtl.sv` — parameterized counter RTL
- `tb.sv` — self-checking testbench

## Run

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```
