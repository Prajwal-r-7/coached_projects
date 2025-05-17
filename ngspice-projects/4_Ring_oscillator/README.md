🔄 4-Stage Ring Oscillator with NAND Gate
This repository contains SPICE simulations for a 4-stage ring oscillator with an enable control implemented using a NAND gate.
🔍 Project Overview
A ring oscillator is a device composed of an odd number of NOT gates whose output oscillates between two voltage levels. This project implements a 4-stage ring oscillator with enable control using a NAND gate and analyzes its key parameters including oscillation frequency, duty cycle, and power consumption.
📁 Repository Structure
/Ring_Oscillator
├── /subcircuits
│   ├── subinv.sp      # Inverter subcircuit
│   └── subcktnand.sp  # NAND gate subcircuit
└── /simulation
    ├── ring_osc.sp    # Main simulation file
    └── output.png     # Waveform output
🔧 Circuit Design
The 4-stage ring oscillator is implemented using:

1 NAND gate (for enable control)
4 inverters connected in series
Feedback from the last inverter to the NAND gate

⚙️ Circuit Operation

When the enable signal (in1) is LOW:

The NAND gate output is forced HIGH
The oscillation is inhibited


When the enable signal (in1) is HIGH:

The NAND gate acts as an inverter
The circuit forms a ring of 5 inverting stages (1 NAND + 4 inverters)
This creates sustained oscillation


The circuit connections are:

NAND gate inputs: Enable signal and feedback from last inverter
NAND gate output connects to first inverter
Four inverters connected in series
Output of the last inverter feeds back to the NAND gate



📊 Key Measurements
The simulation measures several important parameters:
⏱️ Timing Measurements

Oscillation Period (tperiod):

Measured between consecutive falling edges of the output signal
TRIG v(out1) VAL=0.5 FALL=4 TARG v(out1) VAL=0.5 FALL=5


Pulse Width (pw1):

Time the output remains LOW
TRIG v(out1) VAL=0.5 FALL=4 TARG v(out1) VAL=0.5 RISE=4


Pulse Width (pw2):

Time the output remains HIGH
TRIG v(out1) VAL=0.5 RISE=4 TARG v(out1) VAL=0.5 FALL=5


Propagation Delay (tp):

Calculated as total of pw1 and pw2
Represents the complete cycle time


Duty Cycle (dt):

Calculated as pw2/tp
Represents the percentage of time the output is HIGH



⚡ Power Analysis

Average Current (I_avg):

Measured from the power supply from 2ns to 15ns
AVG i(Vpower) from=2n to=15n


Power Consumption:

Calculated as VDD × I_avg
Measures the average power consumed by the oscillator



🧪 Simulation Setup
The simulation is configured as follows:

Supply Voltage (VDD): 1V
Ground (VSS): 0V
Enable Signal: Pulse waveform that transitions from 0 to 1 at 2ns
Transient Analysis: 6ns with 1ns step size

🔑 Importance of Ring Oscillators
Ring oscillators are critical components in digital design for several reasons:

⏰ Clock Generation: They provide internal clock signals without requiring external crystals or resonators.
📊 Process Variation Monitoring: They are commonly used to characterize and monitor semiconductor process variations.
🔬 Performance Benchmarking: The oscillation frequency directly relates to transistor switching speed, making them useful for performance evaluation.
⚡ Power Analysis: They help measure dynamic power consumption in a technology node.
🌡️ Temperature Sensing: Their frequency varies with temperature, making them useful for temperature sensing.
🔄 PLL/DLL Reference: They can serve as voltage-controlled oscillators in Phase-Locked Loops.

💡 Design Considerations

Oscillation Frequency: Determined by the total propagation delay through all stages.
Duty Cycle: Ideally 50%, but can vary based on the symmetry of rise/fall times in the inverters.
Enable Control: The NAND gate provides a clean way to start/stop oscillation without glitches.
Power Consumption: Critical for battery-powered applications, affected by:

Supply voltage
Oscillation frequency
Capacitive load
Transistor sizing


Jitter Performance: Variation in period affects timing precision in digital systems.

🚀 How to Run the Simulation

Ensure you have NGSpice installed on your system
Navigate to the simulation directory
Run the simulation using:
ngspice ring_osc.sp

The measurements (period, duty cycle, power) will be displayed in the console
The waveform will be plotted showing the enable signal and oscillator output

📝 Notes

The oscillation only starts when the enable signal transitions to HIGH at 2ns
The duty cycle calculation provides insight into the symmetry of the inverters
The power measurement excludes the initial startup phase for more accurate steady-state analysis
Even with an even number of inverters (4), oscillation is possible due to the NAND gate providing an additional inverting stage
