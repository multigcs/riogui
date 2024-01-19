# FAQ

## What are slots and modules ?

this are only abstractions and pinout-mappings for easier reuse of modules like a Arduino-CNC-Shield to other boards.

Sometimes it is difficult to assign the correct PIN of an FPGA to the pin of a connector.
Since PMOD is a standard connector (and present on many FPGA boards) and is numbered P1->P12, it is quite easy to assign a function to its pins.
Furthermore, it is also easier if someone has already defined a PMOD module, for example, so you only have to specify which module is connected to which connector and no longer the individual pins.
the same applies to arduino-compatible shields (ChipKit).

## What are expansions ?
if you have a small FPGA with a small number of pins, you can increase the number of inputs and outputs with an expansion-board (like shiftregisters)

so you can easily create a lot of pins from 4 pins (Clock/IN/OUT/Load) -> 8,16,32,...128,... :)


## What are pin modifiers ?

you can configure a chain of modifiers for each input and output pin.

for example toggle or debounce function for push buttons

or inverting an output pin for LED's

you can also combine different modifiers and use them multiple times in a chain


## I can only use rio for LinuxCNC ?

no, you can also use it as a basis for other projects,
for example to build measurement and test instruments for your electronics lab (frequency counters, pulse generators, ... on FPGA basis)


## can i use the UART interface for LinuxCNC ?

no, the latency is too high for these kind of real-time tasks

