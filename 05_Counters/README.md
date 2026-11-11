# Counter Designs

This directory contains a collection of synchronous counter designs written in **SystemVerilog**, along with self-checking testbenches.

The projects progress from basic binary counters to shift-register-based sequence counters and a parameterized modulo counter.

## Projects

| Project | Description | Reset state | Sequence / behaviour |
|---|---|---:|---|
| [4-bit Up Counter](./UpCounter/) | 4-bit synchronous binary up counter | `0000` | 0 → 15 → 0 |
| [4-bit Down Counter](./DownCounter/) | 4-bit synchronous binary down counter | `1111` | 15 → 0 → 15 |
| [4-bit Up/Down Counter](./4bitSyncUpCount/) | Direction-controlled 4-bit counter | `0000` | Counts up when `up_down=1`, down when `up_down=0` |
| [Ring Counter](./RingCounter/) | 4-bit circulating one-hot sequence | `0001` | 0001 → 0010 → 0100 → 1000 → repeat |
| [Johnson Counter](./JohnsonCounter/) | 4-bit twisted-ring counter | `0000` | 8-state sequence |
| [Configurable Modulo-N Counter](./ModCounter/) | Parameterized modulo counter | `0` | 0 → N−1 → 0 |

## Design conventions

- All counters use **positive-edge-triggered sequential logic**.
- Reset is **synchronous and active-high**.
- Sequential state updates use non-blocking assignments (`<=`).
- Counter outputs are checked after the active clock edge in the testbenches.

## Simulation

The testbenches use SystemVerilog and generate a VCD waveform file.

Example using Icarus Verilog from a project directory:

```bash
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
gtkwave wave.vcd
```

For the parameterized modulo counter, the testbench instantiates `N=10` and `WIDTH=4`. Change the parameters in the DUT instantiation to explore other modulo values that fit the selected width.

## Verification coverage

The testbenches check the relevant behaviour for each design, including reset, counting sequence, rollover, direction changes, and sequence repetition. The configurable modulo counter checks two complete cycles for its configured value of N.

## Tools

- SystemVerilog
- Icarus Verilog
- GTKWave

