# ⏱️ Digital Circuit Delay Measurements
This repository contains SPICE simulations for measuring propagation delays across different digital circuit implementations.

## 🔍 Project Overview
This project focuses on analyzing the timing characteristics of various digital circuits by measuring propagation delays from gate to gate and calculating total circuit delays. The study includes multiple circuit configurations to understand delay behavior across different digital logic implementations.

## 📁 Repository Structure
```
/delay_measurements
├── /delay_measurement_ckt1
│   ├── delay_meas_ckt1.sp    # Circuit 1 simulation file
│   ├── circuit.jpeg          # Circuit 1 diagram
│   └── result.png           # Circuit 1 results
├── /delay_measurement_ckt2
│   ├── delay_meas_ckt2.sp    # Circuit 2 simulation file
│   ├── circuit.jpeg          # Circuit 2 diagram
│   └── result.png           # Circuit 2 results
├── /delay_measurement_ckt3
│   ├── delay_meas_ckt3.sp    # Circuit 3 simulation file
│   ├── circuit.jpeg          # Circuit 3 diagram
│   └── result.png           # Circuit 3 results
└── /subcircuits
    ├── subinv.sp            # Inverter subcircuit
    ├── subtnp.sp            # Transmission gate subcircuit
    └── subtran.sp           # Transmission circuit subcircuit
```

## 🔧 Circuit Analysis
This project analyzes three different digital circuit configurations:
- **Circuit 1**: First circuit implementation with specific gate arrangements
- **Circuit 2**: Second circuit implementation with different logic structure  
- **Circuit 3**: Third circuit implementation for comparative analysis
- All circuits utilize common subcircuits (inverters, transmission gates, and transmission circuits)

### ⚙️ Delay Measurement Methodology
For each circuit, the following delay measurements are performed:
1. **Gate-to-Gate Delays**: Individual propagation delays between consecutive logic gates
2. **Path Delays**: End-to-end delays through specific signal paths
3. **Total Circuit Delay**: Overall propagation delay from input to output
4. **Component Analysis**: Individual subcircuit delay contributions

## 🔑 Importance of Delay Measurements
Delay measurements are critical in digital circuit design for several reasons:
1. **💻 Performance Optimization**: Understanding the propagation delays helps identify bottlenecks and optimize circuit performance.
2. **⏰ Timing Analysis**: Accurate delay measurements are essential for static timing analysis (STA) to ensure the circuit meets timing requirements.
3. **⚡ Power Consumption**: Delays directly impact switching activity and thus power consumption in CMOS circuits.
4. **📈 Clock Frequency Determination**: Maximum operating frequency depends on the critical path delay.
5. **🔄 Circuit Comparison**: Comparing delays across different implementations helps choose optimal designs.
6. **📊 Performance Benchmarking**: Delay measurements provide quantitative metrics for circuit performance evaluation.

## 🚀 How to Run the Simulations
1. Ensure you have ngspice installed on your system
2. Navigate to the respective circuit directory (e.g., `delay_measurement_ckt1`)
3. Run the simulation using:
   ```bash
   source delay_meas_ckt1.sp
   ```
   
   (Replace with appropriate circuit filename for other circuits)
4. The measurements will be displayed in the console output
5. Waveforms can be visualized as per the plot commands in the control section
6. Repeat for all three circuits to compare delay characteristics

## 📝 Notes
- Each circuit provides different delay characteristics for comparative analysis
- The subcircuits folder contains reusable components used across all three circuits
- Gate-to-gate delay measurements help identify the slowest components in each circuit
- Total delay measurements provide overall circuit performance metrics
- Results can be used to optimize circuit design and select the best performing implementation