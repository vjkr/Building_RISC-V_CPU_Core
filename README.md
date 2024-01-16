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

Indentation\
In TL-Verilog (within \TLV code blocks), indentation and whitespace are meaningful. Tabs (which have no consistently-defined behavior) are not permitted. Each level of indentation is 3 spaces (and the Makerchip editor helps with this).\

Signal Names\
As long as you stick with the suggested signal names throughout this course, you won’t have any trouble, but, for those who might wish to veer off from the script a bit, TL-Verilog is picky about signal names too. \
Implemented basic gates and full adder\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/2a9bdd5a-4626-4499-bfc7-efb653e01f83">\
Learnig arithmetic operations using an example of Parallel adder (implemented using + expression)\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/799cdd80-3808-451a-87be-dc6b06527c13">\
Verilog provides no less than six reasonable syntaxes for coding a multiplexer, each with pros and cons. TL-Verilog favors the use of the ternary (? :) operator, and we will stick with this throughout the course. 












