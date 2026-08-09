# Project Memory

## Overview

Zynq-7020 FPGA learning labs written in Verilog and organized as independent Vivado projects.

## Layout

- `Projects/`: board-oriented labs and reusable IP examples.
- `Homework/`: alternate implementations and exploratory practice.
- `<lab>/rtl/`: design sources.
- `<lab>/sim/tb/`: behavioral testbenches.
- `<lab>/prj/`: `.xpr`, `.xdc`, and checked-in `.xci` IP metadata.
- `docs/`: user documentation and maintenance notes.

## Validation

Vivado 2025.2.1 is installed at `E:/Development/ZYNQ_Develop/2025.2.1/Vivado/bin/vivado.bat`. Use the generated XSim directory for each project's testbench. For a repository-level sanity check, inspect `git status --short`, `git diff --check`, and confirm generated folders are ignored.

## Git policy

Do not commit Vivado caches, generated IP output products, implementation runs, bitstreams, checkpoints, logs, reports, waveforms, or simulator work directories. Keep `.xci` configuration files when an experiment depends on generated IP.
