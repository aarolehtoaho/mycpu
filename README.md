# MyCPU
## 521404A Digital Techniques 2

**OVERVIEW**

MyCPU is a 16-bit instruction set processor core that is closely based on the processor
architecture described in [1]. The core will be implemented in the design project of course
521404A Digital Techniques 2.


The figure below gives an overview of the interface of the mycpu core, and its typical use case.
<img width="682" height="401" alt="kuva" src="https://github.com/user-attachments/assets/c941f746-fda9-43c1-8184-a9c86ed58ff7" />

The interface signals are:

● clk, rising edge sensitive clock signal input

● rst_n, active-low asynchronous reset input

● a_out, memory address bus

● d_out, memory data write bus

● d_in memory data read bus

● io_in, parallel input-output device (IOPORT) read bus

● wen_out, active-low write enable signal of the memory bus

● iom_out, select signal that indicates is the address and write data meant for the memoryor I/O device


A block diagram of the processor core design is shown below. Module instance names are
shown with upper case letters and the referenced module's name in parentheses after the instance name. Width of multi-bit signals is shown using the notation [MSB:LSB]. Control signals
are shown in red for clarity.

<img width="751" height="572" alt="kuva" src="https://github.com/user-attachments/assets/2d364b70-084d-4a2f-bf1a-2571174cf53c" />

The design consists of the following module instances. The module name is presented in
parentheses.

● PC (pc), program counter

● IR (ir), instruction register

● CU (cu), control unit that contains the control state-machine and instruction decoder

● RB (rb), a 16 x 16-bit register bank. Registers R0 - R7 are user registers, and registers HR1 - HR7 hidden registers that cannot be used as instruction operands.

● FU (fu), function unit that implements various arithmetic and logical functions in combinational logic

● MUXM (muxm), a multiplexer for selecting either the program counter or the bus abus as the source of memory address for output a_out

● MUXD (muxd), a multiplexer for selecting either function unt output fbus, memory data input d_in, or I/O device data input io_in as the write data input of the register bank

● MUXB (muxb), a multiplexer for selecting either the bdat output signal of the register bank or the ins output of the instruction register as the source for bus bbus. A three-bit immediate value is extracted from the instruction register value and zero filled to 16-bits inside the multiplexer.

In this project work, the architecture of the processor core is implemented as a synthesized
register-level SystemVerilog model. The functionality of the model is verified by simulation, and a
gate-level implementation is created from it with a logic synthesis program.


References

[1] Mano, M. M., Kime, C. R. & Martin, T. (2014) "Logic and computer design fundamentals"
