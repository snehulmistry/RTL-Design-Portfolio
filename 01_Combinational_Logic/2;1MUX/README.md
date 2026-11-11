# 4-bit 2:1 Multiplexer in Verilog

A 4-bit 2:1 Multiplexer (MUX) designed in Verilog HDL and verified using a custom testbench with Icarus Verilog and GTKWave.

---

## 📖 Overview

A Multiplexer (MUX) is a combinational logic circuit that selects one of several input signals and forwards the selected input to the output.

This project implements a **4-bit 2:1 Multiplexer**, where a single select signal determines whether the output follows input **A** or **B**.

---

## ✨ Features

- 4-bit data inputs
- Single-bit select input
- Combinational logic implementation
- Verilog RTL design
- Testbench for functional verification
- Waveform verification using GTKWave

---

## 📂 Project Structure

```
.
├── mux2to1.v          # RTL Design
├── mux2to1_tb.v       # Testbench
├── waveforms.vcd      # Simulation waveform
├── waveform.png       # GTKWave screenshot
└── README.md
```

---

## ⚙️ RTL Logic

```verilog
assign Y = (S) ? B : A;
```

### Truth Table

| S | Output |
|:-:|:------:|
| 0 | A |
| 1 | B |

---

## 🧪 Test Cases

| Test | A | B | S | Expected Y |
|------|------|------|---|------------|
| 1 | 0101 | 1111 | 0 | 0101 |
| 2 | 0101 | 1111 | 1 | 1111 |
| 3 | 0011 | 1000 | 0 | 0011 |
| 4 | 0011 | 1000 | 1 | 1000 |

---

## 📊 Simulation Result

The waveform verifies the correct operation of the multiplexer.

- **S = 0 → Y = A**
- **S = 1 → Y = B**

![Waveform](waveform.png)

---

## 🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- Git & GitHub

---

## ▶️ Running the Simulation

Compile:

```bash
iverilog -o mux_sim mux2to1.v mux2to1_tb.v
```

Run:

```bash
vvp mux_sim
```

Open the waveform:

```bash
gtkwave waveforms.vcd
```

---

## 📚 Concepts Covered

- Verilog HDL
- RTL Design
- Combinational Logic
- Multiplexer Design
- Continuous Assignment (`assign`)
- Testbench Development
- Functional Simulation
- Waveform Analysis

---

## ✅ Result

The design was successfully implemented and verified through simulation. The output correctly follows input **A** when the select signal is low (`S = 0`) and input **B** when the select signal is high (`S = 1`).
