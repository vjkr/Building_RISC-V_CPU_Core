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

\In this course, you will build a simple CPU that supports the RISC-V ISA. RISC-V has very rapidly gained popularity due to its open nature--its explicit lack of patent protection and its community focus. Following the lead of RISC-V, MIPS and PowerPC have subsequently gone open as well.

RISC-V is also popular for its simplicity and extensibility, which makes it a great choice for this course. "RISC", in fact, stands for "reduced instruction set computing" and contrasts with "complex instruction set computing" (CISC). RISC-V (pronounced "risk five") is the fifth in a series of RISC ISAs from UC Berkeley. You will implement the core instructions of the base RISC-V instruction set (RV32I), which contains just 47 instructions. Of these, you will implement 31 (Of the remaining 16, 10 have to do with the surrounding system, and 6 provide support for storing and loading small values to and from memory).\\

Like other RISC (and even CISC) ISAs, RISC-V is a load-store architecture. It contains a register file capable of storing up to 32 values (well, actually 31). Most instructions read from and write back to the register file. Load and store instructions transfer values between memory and the register file.\
All instructions are 32 bits. The R-type encoding provides a general layout of the instruction fields used by all instruction types. R-type instructions have no immediate value. Other instruction types use a subset of the R-type fields and provide an immediate value in the remaining bits.\
<img width="501" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/3d994c76-fd27-4cfd-b3a1-056cf8501c4f">\
# uNDERSTANDING RISC AND CISC
ONE OFTHE BEST VIDEOS EVER\ 
https://www.youtube.com/watch?v=6Rxade2nEjk
<img width="671" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/d4822a64-2087-438e-849b-2f49eb6be5ed">\
<img width="900" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/1e801792-a992-499c-bc05-dd8421cc4208">\

## What to build and resources
In this chapter, you will build a subset of your RISC-V CPU core capable of executing a test program that adds numbers from 1 to 9. Subsequently, you will complete the functionality of your core.

By the end of this chapter, you should be able to:
- Explain the role of the fundamental components of a basic CPU microarchitecture.
- Be experienced in expressing digital logic using TL-Verilog.
- Develop an appreciation for the debug process within Makerchip, including: the interpretation of messages in the logs use of visual debug to understand the overall behavior of your logic, use of the waveform viewer to understand detailed behavior, tracing faulty behavior from symptom to cause
- Instantiate pre-existing Verilog and TL-Verilog components.
\The program we will execute on the CPU core is\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/8058a538-38bd-41df-817f-51491ad9d56b">\
\Open the makerchip starting point program from Steve's github repo\
<img width="958" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/532996b3-aa98-4f15-9bf3-8bb715466738">\
\Reference solutioons which are hidden\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/0f30b89e-c914-471f-b596-4f686b5872a0">\

## BUILD using github and python app
Showcasing Your Work\
git clone https://github.com/stevehoover/LF-Building-a-RISC-V-CPU-Core.git(and enter your credentials)\
Then install the Makerchip app:\
pip3 install makerchip-app\
Installing makerchip on desktop and launching\
<img width="960" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/98a7d828-fb13-44b4-96d7-2afd5fc0dedc">\

## CPU Microarchitecture and Implementation Plan
Within several hours, you will construct a CPU core that could be appropriate as a microcontroller. In contrast, a desktop or server CPU chip might be built by a team of hundreds of seasoned engineers over a period of several years.Our CPU will fully execute one instruction with each new clock cycle. Doing all of this work within a single clock cycle is only possible if the clock is running relatively slowly, which is our assumption.\
We will start by implementing enough of the CPU to execute our test program. As you add each new piece of functionality, you will see in the VIZ pane the behavior you implemented, with more and more of the test program executing correctly until it is successfully summing numbers from one to nine. Then we will go back to implement support for the bulk of the RV32I instruction set.\
<img width="499" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/44d4e3af-73ef-4f1f-bd16-18223b2364dd">\
In this course, we are focused on the CPU core only. We are ignoring all of the logic that would be necessary to interface with the surrounding system, such as input/output (I/O) controllers, interrupt logic, system timers, etc.It is typical to implement separate, single-cycle instruction and data caches, and our IMem and DMem are not unlike such caches.\
Trying initial PC logic\
<img width="388" alt="image" src="https://github.com/vjkr/Building_RISC-V_CPU_Core/assets/16399079/d34ffca1-2ef9-4c91-986e-0515938e2a95">\

























