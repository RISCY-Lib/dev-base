# dev-base
Repo Which contains the process and flow basis for new repos.

# Getting Started

## Necessary Installs

Currently the following are required for the RISCY-Lib rrun flow to work

- bash
- Xilinx Viviado (verified with 2022.1)
- GNU Make

## rrun Flow

To get started with a RISCY-Lib flow perform the following steps:

1. ```source setup.sh``` (once per terminal)
2. ```cd run/```
3. ```mkdir [rundir_name]; cd [rundir_name]```
4. ```rrun [cmd]```

## Commands

The following are the currently supported ```rrun`` commands:

- sim
  - Simulate the design
- synth
  - Synthesize the design
- impl
  - Implement the design (synthesizing if necessary)
- bit
  - Create a bit-stream for the design (implementing if necessary)