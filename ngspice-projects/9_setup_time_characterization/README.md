# ⏱️ Setup Time Characterization of Flip-Flops

This repository contains SPICE simulations for characterizing the setup time behavior of Master-Slave Flip-Flop (MSFF) and Pulsed Flip-Flop (PFF) designs through systematic timing analysis and delay optimization studies.

## 🎯 Objective

To characterize the setup time behavior of MSFF and PFF by analyzing the variation of key timing parameters such as D→CLK, CLK→Q, and D→Q delays, and to determine the optimal data arrival point that minimizes total delay.

## 📁 Repository Structure

```
setup_time_characterization/
├── msff/
│   ├── msff_setup_time.sp              # MSFF setup time simulation
│   ├── circuit_msff.png                # MSFF circuit diagram
│   ├── msff_values.png                 # MSFF timing values
│   ├── result_msff.png                 # MSFF simulation results
│   └── setup_time_char_msff.png        # MSFF characterization curve
├── pff/
│   ├── pff_setup_time.sp               # PFF setup time simulation
│   ├── pff_values.png                  # PFF timing values
│   ├── setup_time_char_pff.png         # PFF characterization curve
│   └── result_pff.png                  # PFF simulation results
└── setup_time_charachacterization_of_flipflop.png  # Combined analysis
```

## 🔬 Design Concept & Theory

### Setup Time Fundamentals
- **Setup Time**: Minimum time before clock edge by which data must be stable for correct operation
- **Critical Timing**: Trade-off between D→CLK delay and CLK→Q propagation delay
- **Optimization Point**: Mathematical minimum where derivative of total delay equals zero (45° slope)

### Characterization Methodology
- **Data Positioning**: Starting with data far from clock rising edge
- **Step Analysis**: Moving data towards clock edge in 100ps increments
- **Delay Measurement**: Recording CLK→Q and D→Q delays for each step
- **Curve Generation**: Plotting delay vs D→CLK timing relationship

### Key Timing Parameters
- **D→CLK Delay**: Time difference between data and clock transitions
- **CLK→Q Delay**: Propagation delay from clock to output
- **D→Q Delay**: Total propagation delay from data to output
- **Setup Time**: Critical timing boundary for reliable operation

## 📊 Analysis Results

### Characterization Curve Features
- **Failure Region**: Data too close to clock edge (unreliable operation)
- **Variable Region**: Transition zone where delays change rapidly
- **Constant Region**: Stable operation with consistent CLK→Q delay
- **Optimal Point**: Minimum total delay at 45° slope intersection

## 🚀 How to Run the Simulations

### Prerequisites
- NGSpice installed on your system
- Access to flip-flop subcircuit files

### Execution Steps

**MSFF Setup Time Analysis:**
```bash
source msff_setup_time.sp
```

**PFF Setup Time Analysis:**
```bash
source pff_setup_time.sp
```

### Expected Results
- **Timing Curves**: D→CLK vs CLK→Q delay relationships
- **Optimization Points**: Minimum delay operating points
- **Setup Time Values**: Critical timing boundaries for each design
- **Performance Comparison**: MSFF vs PFF timing characteristics
