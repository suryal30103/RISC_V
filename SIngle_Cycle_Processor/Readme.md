# RISC-V Processor Design (Single-Cycle & Pipelined)

This repository documents my journey in understanding and implementing the RISC-V processor architecture using Verilog HDL and Vivado.

---

## 🔧 Project Overview

This repo contains two key parts:

1. **Single-Cycle RISC-V Processor (Fully Developed by Me)**  
   - Written from scratch in Verilog.
   - Synthesized and tested using Xilinx Vivado.
   - Implements a basic instruction set and control path logic.
   - Focused on gaining deep understanding of datapath and control signals.

2. **Pipelined RISC-V Processor (Reference & Learning)**  
   - Based on open-source resources (link provided below).
   - Currently under study to gradually re-implement and modify on my own.
   - Used for exploring performance improvement concepts: IF, ID, EX, MEM, WB stages.

---

## 🚀 Future Goals

- Build my own pipelined version from scratch in Vivado.
- Extend instruction support and improve hazard handling (forwarding, stalling).
- Possibly simulate on FPGA (when hardware is available).

---

## 📂 Repo Structure

```bash
.
├── single_cycle/         # My own Verilog implementation (working)
├── pipelined_reference/  # External reference (to be reworked in future)
├── vivado_project/       # Vivado project files and synthesis reports
└── README.md             # This file
