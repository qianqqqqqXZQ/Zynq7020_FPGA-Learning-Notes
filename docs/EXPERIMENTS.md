# Experiment Index

The repository is organized as short labs rather than one monolithic design. The table below is the intended progression.

| Level | Experiments | Main idea |
| --- | --- | --- |
| 1 | `led`, `key_led` | Combinational output and button-controlled state |
| 2 | `flow_led`, `breath_led` | Clocked counters and PWM-style brightness control |
| 3 | `top_key_beep`, `top_two_key_beep`, `touch_led`, `touch_flow_led` | Debouncing and board I/O composition |
| 4 | `ip_clk_wiz` | Generated clock and lock handling |
| 5 | `ip_1port_ram`, `ip_2port_ram` | Block RAM access patterns |
| 6 | `ip_fifo` | Independent read/write clocks and FIFO status flags |

`Homework/` contains alternate or more exploratory versions of several ideas. It is kept separate from the board-oriented `Projects/` collection so that experiments can evolve without obscuring the main progression.
