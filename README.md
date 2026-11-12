# RTL Design & Verification Portfolio

A growing portfolio of digital design projects implemented in Verilog/SystemVerilog, with testbenches and simulation workflows.

## Project Areas
- **01_Combinational_Logic** — MUX, decoder, encoder, comparator, adders and subtractors
- **02_Sequential_Logic** — D, JK and T flip-flops
- **03_Registers** — 4-bit register and SISO, SIPO, PISO, PIPO shift registers
- **04_Arithmetic_Designs** — 4-bit ALU
- **05_Counters** — counter designs (being added)
- **06_FSM** — finite-state-machine designs (101 Moore sequence detector)
- **07_SystemVerilog_Verification** — verification exercises (planned)

## Tools
Icarus Verilog · Verilator · Surfer · Verilog HDL · SystemVerilog

## Run a Verilog project
From a project directory containing the RTL and testbench source files (for example, `rtl.sv` and `tb.sv`):
```bash
iverilog -g2012 -o sim rtl.v tb.v
vvp sim
```

## About
This is an evolving engineering portfolio. Existing projects are consolidated here while their original standalone repositories remain unchanged. FSM and verification projects will be added as their source files are completed and verified. Current simulation workflow uses native Windows PowerShell with Icarus Verilog and Surfer (no WSL).

**Snehul Mistry** · Electronics & Communication Engineering
