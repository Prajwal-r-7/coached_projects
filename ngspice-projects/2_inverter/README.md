# 🔄 CMOS Inverter Circuit Simulation

This repository contains SPICE simulations for analyzing the characteristics of a basic CMOS inverter circuit.

## 🔍 Project Overview

The CMOS inverter is the fundamental building block of digital integrated circuits. This project demonstrates the behavior and electrical characteristics of a CMOS inverter through various simulation methods using NGSpice.

## 📁 Repository Structure

```
/2_inverter
└── /inverter
    ├── inverter.sp            # Main SPICE simulation file
    ├── vin_vs_vout.png        # Input vs Output voltage waveform
    ├── vout_vs_vin(vtc).png   # Voltage Transfer Characteristic (VTC)
    └── Id_vs_vds.png          # Drain current vs Drain-Source voltage
```

## 🔧 CMOS Inverter Basics

A CMOS inverter consists of two complementary MOSFETs (Metal-Oxide-Semiconductor Field-Effect Transistors):
- PMOS (P-channel MOSFET) - connected to VDD (supply voltage)
- NMOS (N-channel MOSFET) - connected to VSS (ground)

### ⚙️ Circuit Operation

- When input is LOW (0V), the PMOS transistor turns ON and NMOS turns OFF, connecting the output to VDD (HIGH)
- When input is HIGH (1V), the NMOS transistor turns ON and PMOS turns OFF, connecting the output to VSS (LOW)
- This creates the logical inversion operation: output = NOT(input)

### 📊 Key Parameters

In this simulation:
- Supply Voltage (VDD): 1V
- Ground (VSS): 0V
- PMOS Width: 10μm
- NMOS Width: 10μm
- Gate Length (both transistors): 0.18μm
- Load Capacitance: 1nF

## 📈 Simulation Results

### Voltage Transfer Characteristic (VTC)

The VTC plot (`vout_vs_vin(vtc).png`) shows how the output voltage changes with respect to the input voltage. Key points on this curve include:

- **VOH**: Maximum output voltage when input is LOW
- **VOL**: Minimum output voltage when input is HIGH
- **VIH**: Input voltage above which the output is considered LOW
- **VIL**: Input voltage below which the output is considered HIGH
- **Vt**: Switching threshold voltage (measured when Vout = 0.5V)

The VTC curve demonstrates the inverter's:
- Voltage gain
- Noise margins
- Switching characteristics

### Input vs Output Waveform

The `vin_vs_vout.png` shows the time-domain response of the inverter. When the input transitions from LOW to HIGH, the output transitions from HIGH to LOW, and vice versa, demonstrating the inverting behavior of the circuit.

### Drain Current vs Gate-Source Voltage

The `Id_vs_vds.png` shows how the drain current through the transistors varies with respect to the gate-source voltage, which helps characterize the transistor operation regions

## 🧪 Simulation Methods

The inverter.sp file contains two main simulation approaches:
1. **Transient Analysis**: Uncomment `.tran 1m 100m` to observe the time-domain behavior
2. **DC Analysis**: Using `.dc Vgate 0 1 1m` to sweep the input voltage and generate the VTC

## 🚀 How to Run the Simulation

1. Ensure you have NGSpice installed on your system
2. Navigate to the inverter directory
3. Run the simulation using:
   ```
   source inverter.sp
   ```
4. Modify the file to uncomment different plot commands for various analyses

## 📝 Notes

- The threshold voltage (Vt) is measured when Vout = 0.5V using the command: `.measure dc Vt FIND v(in) WHEN v(vout)=0.5`
- For time-domain analysis, uncomment the appropriate line in the SPICE file
- The circuit uses BSIM4 SOI transistor models for accurate simulation
