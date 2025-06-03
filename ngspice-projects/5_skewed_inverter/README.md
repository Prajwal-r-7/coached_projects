# ⚡ Analysis of Skewed and Unskewed CMOS Inverter Using NGSpice

This repository contains comprehensive SPICE simulations analyzing the voltage transfer characteristics (VTC) of CMOS inverters under various skew conditions by systematically varying the PMOS to NMOS width ratios.

## 🎯 Objective

To analyze and compare the voltage transfer characteristics (VTC) of a CMOS inverter under unskewed and skewed conditions by varying the PMOS to NMOS width ratios, and to understand how transistor sizing affects the switching threshold and overall inverter behavior.

## 📁 Repository Structure

```
skewed_inverter/
├── skewed_inverter.sp           # Main simulation file with all configurations
├── result_unskewed.png          # VTC results for balanced inverter
├── result_low_skew.png          # VTC results for low skew conditions
└── result_high_skew.png         # VTC results for high skew conditions
```

## 🔬 Concept & Theory

### Skew Classifications

#### 🔄 Unskewed Inverter
- **Configuration**: Wp = 2Wn (typical balanced design)
- **Characteristics**: 
  - Balanced rise and fall times
  - Switching threshold near VDD/2
  - Optimal noise margins
- **Applications**: General-purpose logic gates

#### ⬇️ Low Skew Inverter
- **Configuration**: Wp < Wn (NMOS stronger)
- **Ratios Analyzed**: 1:2, 1:4, 1:8, 1:12
- **Characteristics**:
  - Faster pull-down transition
  - Lower switching threshold (closer to ground)
  - Stronger LOW output drive
- **Applications**: When fast LOW transitions are critical

#### ⬆️ High Skew Inverter
- **Configuration**: Wp > Wn (PMOS stronger)
- **Ratios Analyzed**: 2:1, 4:1, 8:1, 12:1
- **Characteristics**:
  - Faster pull-up transition
  - Higher switching threshold (closer to VDD)
  - Stronger HIGH output drive
- **Applications**: When fast HIGH transitions are critical

#### Simulation Parameters
- **Input Sweep**: 0V to VDD (typically 3.3V or 5V)
- **Analysis Type**: DC sweep for VTC generation
- **Measurement**: Threshold voltage extraction using .measure statements
- **Output**: Voltage transfer characteristic curves

### Circuit Operation

1. **DC Analysis**: Input voltage swept from 0V to VDD
2. **VTC Generation**: Output voltage plotted against input voltage
3. **Threshold Extraction**: Vth measured at Vout = VDD/2 crossing point
4. **Comparative Analysis**: Multiple configurations overlaid for comparison

## 🚀 How to Run the Simulation

### Prerequisites
- NGSpice installed on your system
- Basic understanding of SPICE syntax and commands

### Execution Steps
```bash
source skewed_inverter.sp
```

## 📈 Practical Applications

#### 🔧 Interface Design
- **Level Shifters**: Using skewed inverters for voltage level translation
- **Buffer Chains**: Optimizing drive strength in cascaded stages
- **Clock Distribution**: Balancing rise/fall times in clock networks
