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
## Lab Calculator implementation
I am unable to implement calculator using ternary operator, keeping this for future work\
<img width="959" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/b33add1a-7b8e-4b76-9411-36bb7f4b4141">\
limiting values on val1 and val2 which will help in analyzing the waveforms easily.I could not do this because of calculator hence did on parallel adder\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/c1900b38-c117-4ebc-a1cf-065a595df426">\

I am able to generate viz but not exact results. As i am using viz library for calculator but my code is parallel adder\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/c1f3457e-c12a-4bc2-89f8-d9a15ab28920">\

Also noteworthy is the fact that TL-Verilog is really a Verilog implementation of TL-X, a language extension defined to layer atop any HDL to extend it with transaction-level features. So there is a migration path from any supported HDL (and, as of this writing, Verilog is the only one).\
<img width="352" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/8210fb6e-c97d-4aa8-bacf-f8259a3dc274">\

## Sequential circuits
\in TLV, >>1 and >>2 implement previous version and pre-previous versions with the help of FFs \
<img width="514" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/40b32b0f-08b5-4107-8170-555f0af750e5">\

A simple counter implementation can be done using following code\
``` $num[31:0] = $reset ? 1 : (>>1$num + >>2$num);```

<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/34aef911-6178-4e60-9b51-d2d28b59e155">\

Use similar logic to connect output value of calculator (I have done for parallel adder) to input, and reset value when reset is asserted. \
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/254c69a3-7837-4b48-bbd9-b68a0e7593c5">\

## RISC-V
By the end of this chapter, you should understand:
- The role of compilers and assemblers.
- The role of an instruction set architecture (ISA).
- The general properties of RISC-V versus other ISAs.

\Likely, you have experience writing programs in languages like Python, JavaScript, Java, C++, etc. These languages are portable and can run on just about any CPU hardware. CPU’s do not execute these languages directly. They execute raw machine instructions that have been encoded into bits as defined by an instruction set architecture (ISA). Popular ISAs include x86, ARM, MIPS, RISC-V, etc.\
A compiler does the job of translating a program’s source code into a binary file or executable containing machine instructions for a particular ISA.The binary file is easily interpreted by hardware, but not so easily by a human. The ISA defines a human-readable form of every instruction, as well as the mapping of those human-readable assembly instructions into bits. \
You will use assembly-level test programs in this course to debug your RISC-V design.\
<img width="496" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/bf2fca7b-ac42-49d4-b545-889156f9f67f">\





















