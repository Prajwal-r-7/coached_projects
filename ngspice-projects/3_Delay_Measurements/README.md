# ⏱️ XOR Gate Delay Measurements

This repository contains SPICE simulations for measuring propagation delays in a transmission gate-based XOR/XNOR circuit implementation.

## 🔍 Project Overview

The project focuses on analyzing the timing characteristics of an XOR gate built using transmission gates and inverters. The circuit is designed to perform both XOR and XNOR operations:
- The output at `o1` (before the final inverter) provides the XOR function
- The output at `oout` (after the final inverter) provides the XNOR function

## 📁 Repository Structure

```
/Delay_Measurements
├── /subcircuits
│   ├── subinv.sp    # Inverter subcircuit
│   └── subtnp.sp    # Transmission gate subcircuit
└── /xor_delay_measurements
    ├── xor_delay_meas.sp    # Main simulation file
    ├── result.png           # Simulation results
    └── xor_circuit.jpg      # Circuit diagram
```

## 🔧 Circuit Design

The XOR gate is implemented using:
- Two transmission gates (TG)
- Two inverters
- The select signal (s1) controls which transmission gate is active

### ⚙️ Circuit Operation

1. When select signal `s1` is HIGH:
   - The first transmission gate passes input `a1`
   - The second transmission gate is blocked

2. When select signal `s1` is LOW:
   - The first transmission gate is blocked
   - The second transmission gate passes input `b1`

3. The outputs are:
   - `o1`: XOR output (before the final inverter)
   - `oout`: XNOR output (after the final inverter)

## ⏱️ Delay Measurements

The simulation measures various propagation delays through the circuit:

1. **Individual Component Delays**:
   - Inverter delay: `s1 --> sout`
   - 1st transmission gate delay: `a1 --> o1`
   - 2nd transmission gate delay: `b1 --> o1`
   - Final inverter delay: `o1 --> oout`

2. **Path Delays**:
   - Select to output: `s1 --> o1` and `s1 --> oout`
   - Input A to output: `a1 --> oout`
   - Input B to output: `b1 --> oout`

## 🔑 Importance of Delay Measurements

Delay measurements are critical in digital circuit design for several reasons:

1. **💻 Performance Optimization**: Understanding the propagation delays helps identify bottlenecks and optimize circuit performance.

2. **⏰ Timing Analysis**: Accurate delay measurements are essential for static timing analysis (STA) to ensure the circuit meets timing requirements.

3. **⚡ Power Consumption**: Delays directly impact switching activity and thus power consumption in CMOS circuits.

4. **📈 Clock Frequency Determination**: Maximum operating frequency depends on the critical path delay.

## 🚀 How to Run the Simulation

1. Ensure you have ngspice installed on your system
2. Navigate to the `xor_delay_measurements` directory
3. Run the simulation using:
   ```
   ngspice xor_delay_meas.sp
   ```
4. The measurements will be displayed in the console output
5. Waveforms can be visualized as per the plot commands in the control section

## 📝 Notes

- The circuit can be used for both XOR and XNOR operations depending on which output node is used:
  - For XOR operation: Use the output at node `o1` (before the final inverter)
  - For XNOR operation: Use the output at node `oout` (after the final inverter)

