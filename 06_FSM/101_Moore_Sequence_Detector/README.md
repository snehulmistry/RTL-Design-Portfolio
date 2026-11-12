# 101 Non-Overlapping Moore Sequence Detector

## Overview
A finite-state machine (FSM) that detects the serial input pattern `101`. The design uses a Moore architecture and returns to the initial state after detection, so it is non-overlapping.

## Design Details
- **FSM type:** Moore
- **Detection pattern:** `101`
- **Overlap:** Non-overlapping
- **States:** S0, S1, S2, S3
- **State encoding:** 2-bit binary
- **Reset:** Synchronous, active-high
- **HDL:** SystemVerilog

## State Meaning

| State | Meaning | Output |
|---|---|---:|
| S0 | No useful bits matched | 0 |
| S1 | Received `1` | 0 |
| S2 | Received `10` | 0 |
| S3 | Detected `101` | 1 |

## State Transitions

| Current State | Input `x=0` | Input `x=1` |
|---|---|---|
| S0 | S0 | S1 |
| S1 | S2 | S1 |
| S2 | S0 | S3 |
| S3 | S0 | S0 |

The output is asserted only while the FSM is in S3:

```systemverilog
assign out = (state == S3);
```

## Files
- `rtl.sv` — FSM implementation
- `tb.sv` — self-checking SystemVerilog testbench

## Tools and Simulation Environment
- Windows PowerShell (native Windows workflow; no WSL)
- Icarus Verilog for compilation and simulation
- Surfer for VCD waveform inspection

## Run Simulation

Open PowerShell in this project directory and run:

```powershell
iverilog -g2012 -o sim rtl.sv tb.sv
vvp sim
surfer wave.vcd
```

Expected test output:

```text
TEST PASSED: 101 detected
TEST PASSED: Output returned to 0
Simulation Completed
```

The testbench writes `wave.vcd`, which can be opened in Surfer. Add `clk`, `rst`, `x`, `state`, `next_state`, and `out` to inspect the sequence detection and state transitions.

## Verification
- Detects the input sequence `101`.
- Confirms the output goes high in S3.
- Confirms the FSM returns to S0 and the output goes low on the following clock edge.
