# Project Notes

## Overview

This repository contains Zynq7020 / FPGA learning projects using Verilog, Vivado project files, constraints, and simulation testbenches.

## Layout

- `Homework/`: personal practice projects.
- `Projects/`: board/course practice projects.
- `*/rtl/`: Verilog design source files.
- `*/sim/tb/`: Verilog testbench source files.
- `*/prj/*.xpr`: Vivado project files.
- `*/prj/*.srcs/constrs_1/new/*.xdc`: Vivado constraint files.

## Git Rules

- Keep source files, constraints, project files, and documentation under version control.
- Do not add Vivado or simulator generated outputs such as `*.runs/`, `*.cache/`, `*.hw/`, `*.sim/`, `.Xil/`, `sim/work/`, `*.bit`, `*.dcp`, `*.jou`, `*.log`, `*.pb`, `*.rpt`, `*.rpx`, and `*.wlf`.
- Do not keep generated checkpoint references such as `utils_1/imports/**/*.dcp` in committed Vivado project files.
- The root `.gitignore` is intended to prevent new generated files from being added. It does not remove files already tracked by Git.
- Before large refactors or destructive cleanup, make a Git commit first.
- GitHub remote: `https://github.com/qianqqqqqXZQ/Zynq7020_FPGA-Learning-Notes.git`

## Useful Commands

- Check repository state: `git status --short --branch`
- Check remote URL: `git remote -v`
- Verify ignored files: `git status --ignored --short`
- Check one ignore rule: `git check-ignore -v <path>`
- Push main branch: `git push -u origin main`

## Build And Test

There is no single root-level automated build or test command confirmed yet. Use the relevant Vivado `.xpr` project under each module's `prj/` directory and the testbench files under `sim/tb/`.
