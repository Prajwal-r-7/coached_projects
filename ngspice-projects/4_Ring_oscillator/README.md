# 🔄 4-Stage Ring Oscillator with NAND Gate
This repository contains SPICE simulations for a 4-stage ring oscillator with an enable control implemented using a NAND gate.

## 🔍 Project Overview
A ring oscillator is a device composed of an odd number of NOT gates whose output oscillates between two voltage levels. This project implements a 4-stage ring oscillator with enable control using a NAND gate and analyzes its key parameters including oscillation frequency, duty cycle, and power consumption.

## 📁 Repository Structure

/Delay_Measurements
├── /subcircuits
│   ├── subinv.sp    # Inverter subcircuit
│   └── subtnp.sp    # Transmission gate subcircuit
└── /xor_delay_measurements
    ├── xor_delay_meas.sp    # Main simulation file
    ├── result.png           # Simulation results
    └── xor_circuit.jpg      # Circuit diagram
    

### ⚙️ Circuit Operation
1. When the enable signal (`in1`) is LOW:
   - The NAND gate output is forced HIGH
   - The oscillation is inhibited
2. When the enable signal (`in1`) is HIGH:
   - The NAND gate acts as an inverter
   - The circuit forms a ring of 5 inverting stages (1 NAND + 4 inverters)
   - This creates sustained oscillation
3. The circuit connections are:
   - NAND gate inputs: Enable signal and feedback from last inverter
   - NAND gate output connects to first inverter
   - Four inverters connected in series
   - Output of the last inverter feeds back to the NAND gate

## ⏱️ Timing Measurements
The simulation measures several important parameters:
1. **Oscillation Period (tperiod)**:
   - Measured between consecutive falling edges of the output signal
2. **Pulse Width (pw1 & pw2)**:
   - pw1: Time the output remains LOW
   - pw2: Time the output remains HIGH
3. **Duty Cycle (dt)**:
   - Calculated as pw2/tp
   - Represents the percentage of time the output is HIGH

## ⚡ Power Analysis
1. **Average Current (I_avg)**:
   - Measured from the power supply from 2ns to 15ns
   - `AVG i(Vpower) from=2n to=15n`
2. **Power Consumption**:
   - Calculated as VDD × I_avg
   - Measures the average power consumed by the oscillator

## 🔑 Importance of Ring Oscillators
Ring oscillators are critical components in digital design for several reasons:
1. **⏰ Clock Generation**: They provide internal clock signals without requiring external crystals.
2. **📊 Process Variation Monitoring**: They are commonly used to characterize semiconductor process variations.
3. **🔬 Performance Benchmarking**: The oscillation frequency directly relates to transistor switching speed.
4. **⚡ Power Analysis**: They help measure dynamic power consumption in a technology node.

## 🚀 How to Run the Simulation
1. Ensure you have NGSpice installed on your system
2. Navigate to the simulation directory
3. Run the simulation using:
   ```bash
   source ring_osc.sp

The measurements (period, duty cycle, power) will be displayed in the console
The waveform will be plotted showing the enable signal and oscillator output

📝 Notes

The oscillation only starts when the enable signal transitions to HIGH at 2ns
The duty cycle calculation provides insight into the symmetry of the inverters
The power measurement excludes the initial startup phase for more accurate steady-state analysis
Even with an even number of inverters (4), oscillation is possible due to the NAND gate providing an additional inverting stage
