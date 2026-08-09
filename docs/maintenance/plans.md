# Repository Cleanup Plan

- [x] Create a Git snapshot before the cleanup.
- [x] Define repository boundaries and a GitHub-friendly ignore policy.
- [x] Write English and Chinese README files and an experiment index.
- [x] Convert user-facing Verilog/XDC comments to clear English.
- [x] Review retained RTL and fix the FIFO read-domain reset typo found during cleanup.
- [ ] Review every retained Vivado project for stale generated checkpoint references.
- [ ] Run the available XSim smoke test for `Projects/ip_2port_ram` after cleanup (tool exits before launch with Windows status `-1073741515`; RTL/XPR checks pass).
- [ ] Commit the curated source set and documentation.
