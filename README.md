# Verilog CLOCK

## Digital Logic CLOCK - designed with System Verilog and implemented on Altera's DE1-SOC ##

## Contents

* [General](#general)
* [Project Challenges](#project-challenges)
* [Design Description](#design-description)
* [Hardware Design Diagram](#hardware-design-diagram)
* [RTL Netlist View Tool](#RTL-netlist-view-tool)

## General
The idea of this project was to create a simple System Verilog design for a AM/PM clock based on digital logic on an FPGA. 

<p align="center"><img src="/Media/Photos/Top_B.jpg" width="80%"></p>
<p align="center">view of the DE1-SOC <b>CLOCK</b> Implementation</p>

### Navigating Directories
- <b> Media: </b> Includes photos of the project, diagrams and a short video of the working design on the FPGA.
- <b> Simulation: </b> Includes .do files. regress.do includes, when run on Modelsim, just load the top level rtl testbench and runs it. The rest of the `.do` files load the wave signals to the relevant testbenches
- <b> Source: </b> This directory includes two folders. The Modules include the System-Verilog modules. The modules included are: `card_7seg.sv`, `BCD.sv`, `CLOCK.sv`, and `clock_top.sv` (top-level-module). The Testbenches folder includes all of the corresponding testbenched.
- <b> Synthesis: </b> Thie directory includes only 2 files. The first, `CLOCK.sof` if the .sof file you can load direcly onto the DE1-SOC board. The other is the DE1-SOC pin assignment file- for the users ease-of-use.

## Project Challenges
Some of the goals of the project were:
- Asynchrounous Design (multiple clocks used for state transition and for manual time configuration.
- System Verilog Practice
- Advanced debugging techniques practice (e.g SignalTap)
- For fun! (To show friends what you can do with hardware design on an FPGA with just 1 driving signal - 50MHz crystal).

## Design Description
The design of the clock is based on simple busses, flip-flops, and mux's.
The whole system can be seen as a state machine system with two states represented by the TMOD bit. 
- TMOD == 1'b0 : `CLK_RUN` - this means that the clock is running and incrementing regularly with time
- TMOD == 1'b1 : `CLK_SET` - this means that the time has stopped and that the minutes and hours can be incremented manually
** More on the states [here](#states) <br>
<br>
<b>Registers:</b><br>
1. 26-bit counter. This register is intended to count from [$0$ to $50*10^6$] which is $26'b10111110101111000010000000$ in binary and is defined in the `CLOCK.sv` module as a macro `define Fifty_M <br>
2. (X2) 6-bit registers for Seconds and Minutes - 6-bits for ranges of [0:59] <br>
3. (X1) 5-bit register for Hours - 5-bits for range of [0:23]. <br>
4. State Flip-Flop register called TMOD - defines the state as above <br>

### States
<b>CLK_RUN state:</b><br>
The 50MHz clk will increment the counter until $50*10E6$ at which points the inc_min flag will be raised with will increment the seconds register.
The seconds register increments until it gets to $59$ at which point in resets to 0 and the inc_min flag will be raised.
The minutes register increments in the same way, and once the minutes resets to 0 the inc_hr flag will be raised.
The hours register incrementes until $23$ and then resets to 0.
Transitioning to the `CLK_SET` state occurs by presing the physical button on the FPGA (KEY[3]).

<b>CLK_SET state:</b><br>
The 50MHz signal is disconnected from the circuit, the counter stopd incrementing. In this state the seconds will stop and the inc_min and inc_hr signals will be determined by 2 physical buttons on the FPGA (KEY[0] and KEY[1]). Pressing one of these will increment either the minutes or the hour. Returning to the `CLK_RUN` state occurs by pressing the physical button on the FPGA (KEY[3]).

### Hardware Design Diagram
<p align="center"><img src="/Media/Diagrams/Hardware_CLK_Diagram_B.png" width="80%"></p>
<p align="center">RTL Hardware Diagram Sketch</p>
<br>

### RTL Netlist View Tool
<p align="center"><img src="/Media/Diagrams/CLK_RTL_Viewer_B.png" width="80%"></p>
<p align="center"><b>Quartus</b> RTL Netlist Viewer - <b>CLOCK Module</b></p>
<br>
<p align="center"><img src="/Media/Diagrams/Top_RTL_Viewer_B.png" width="80%"></p>
<p align="center"><b>Quartus</b> RTL Netlist Viewer <b>Top-level Module</b></p>
<br>
