# Building_RISC-V_CPU_Core
https://learning.edx.org/course/course-v1:LinuxFoundationX+LFD111x+3T2022/home

Building a RISC-V CPU Core (LFD111x) has been created by the Linux Foundation and RISC-V International in partnership with the Open Source FPGA Foundation.This is a crash course in digital logic design and basic CPU microarchitecture. Using the Makerchip

https://github.com/stevehoover/LF-Building-a-RISC-V-CPU-Core For latest updates on the course.\
Launch Makerchip.com IDE\
Open 'Long Division' example and split window to give space for 'log' window to observe results.Similarly for 'waveform' and 'logic'\
\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/74bc6f25-6f04-4fbc-87fd-4a273e3d701a">
\
Trying to complete first Lab by\
- [X] Open the "Validity Tutorial".\
- [X] Click "Load Pythagorean Example".\
- [X] Split panes and move tabs between panes.\
- [X] Zoom/pan in Diagram with the mouse wheel and drag.\
- [X] Zoom Waveform with the "Zoom In" button.\
- [X] Click $bb_sq to highlight. \

## DONE WITH FIRST LAB EXPT\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/e5bd0101-e6df-4e27-8866-7ea7358c7f92">\

## Understand the TL-Verilog language syntax for expressing combinational and arithmetic logic functions.\
use of Visual Debug capabilities, unique to the Makerchip platform.\

Let’s try coding an inverter (a NOT gate) in Makerchip. As you go through this lab exercise, check the box for each step when done, to ensure you perform all required steps.
- [X] Reload the Makerchip IDE to begin with the default code template. (You could also use Ctrl-Z in the Editor to restore to the default template or load the default template from the Examples page.)
- [X] The first line of the source file specifies the TL-Verilog language version. If it is other than "1d", it may be necessary to revert the language version to be consistent with this course. In this case, check the GitHub repository for guidance.
- [X] In place of "//...", type "$out = ! $in1;". Be sure to preserve the 3-spaces of indentation, similar to the surrounding expressions. This is an inverter.
- [X] Compile and simulate (under the Editor’s "E" menu, or Ctrl-Enter). If any red X’s appear on the tabs (vs. green checkmarks), make sure you followed the instructions properly and try to resolve the issue. Use the LOG to debug if necessary, or use the video on the next page in times of desperation.\

1d on first line of code specifies TV-Verilog Language\
In place of "//...", type "$out = ! $in1;" \
TL-Verilog, your assignment statement acts as the declaration of its output signal(s)\
There was no need to write a test bench to provide stimulus (input) to your inverter. Makerchip provides random stimulus for dangling inputs.\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/0febf166-6ed7-4195-b147-55574cfc01da">\










