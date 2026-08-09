# Zynq-7020 FPGA 学习实验集

这是一个面向 Zynq-7020 开发板的小型 FPGA 实验集合。每个实验都尽量保持独立，按照统一的 Vivado 目录组织，方便单独打开、仿真和扩展。

[English README](README.md)

## 实验内容

实验从基础组合/时序逻辑开始，逐步覆盖时钟、存储器 IP、异步 FIFO 和开发板外设交互。

| 方向 | 实验 |
| --- | --- |
| LED 与计时 | `led`、`flow_led`、`breath_led`、`key_led`、`touch_led` |
| 按键与蜂鸣器 | `top_key_beep`、`top_two_key_beep`、`touch_flow_led` |
| 时钟管理 | `ip_clk_wiz` |
| 存储器 | `ip_1port_ram`、`ip_2port_ram` |
| 跨时钟域 | `ip_fifo` |
| 扩展练习 | `Homework/syn_flow_led`、`Homework/top_two_breath_led` |

完整实验通常包含以下目录：

```text
<lab>/
├── rtl/                 Verilog 设计源码
├── sim/tb/              仿真 testbench（如适用）
└── prj/                 Vivado 工程、XDC 约束和 IP 配置
```

## 工具链

- Vivado 2025.2.1（面向 Xilinx Zynq-7000 系列）
- 使用 XSim 运行仓库中的行为级 testbench
- 使用每个实验 XDC 文件中的 Zynq-7020 开发板引脚分配

如果使用其他开发板，请在综合或实现前替换相应的 XDC 引脚约束。

## 打开实验

1. 启动 Vivado，打开 `Projects/<lab>/prj/` 或 `Homework/<lab>/prj/` 下的 `.xpr` 文件。
2. 检查顶层模块和对应的 XDC 文件。
3. 先运行 **Run Simulation**，连接开发板后再进行综合和实现。

Vivado 会在本地重新生成缓存、IP 输出、仿真数据库和实现结果。这些文件已被 `.gitignore` 排除；仓库保留的 `.xci` 是可移植的 IP 配置，克隆后请重新生成输出文件。

## 命令行仿真

对于带有 XSim 脚本的工程，在生成的 `prj/<name>.sim/sim_1/behav/xsim/` 目录中执行：

```powershell
xvlog --relax -prj <testbench>_vlog.prj
xelab --relax -debug typical xil_defaultlib.<testbench> xil_defaultlib.glbl
xsim <snapshot> -tclbatch <testbench>.tcl
```

snapshot 名称由 Vivado 生成，重新生成 IP 后可能变化；RTL 和 testbench 源码才是稳定的输入。

## 提交规范

提交只包含源码、约束、Vivado 工程定义、IP 配置、testbench 和文档。构建结果、bitstream、checkpoint、波形、日志和仿真工作目录均由 [`.gitignore`](.gitignore) 排除。

## 学习路径

建议从 `led`、`flow_led` 开始，再对比 `breath_led` 中的计数器计时，以及按键/触摸实验中的输入同步和消抖。RAM 和 FIFO 实验适合继续学习同步存储器、生成式 IP 和跨时钟域设计。
