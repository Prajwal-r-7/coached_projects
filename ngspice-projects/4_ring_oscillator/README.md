# 🔄 Ring Oscillator Analysis with Skewed Inverters

This repository contains comprehensive SPICE simulations for ring oscillators with different configurations and skew conditions, analyzing their performance characteristics under various transistor sizing scenarios.

## 🔍 Project Overview

Ring oscillators are critical components in digital design, consisting of an odd number of inverting stages whose output oscillates between two voltage levels. This project implements and analyzes both 5-stage and 9-stage ring oscillators under three different skew conditions to understand how transistor sizing affects oscillator performance.

## 📁 Repository Structure

```
ring_oscillator/
├── five_stage_ring_oscillator/
│   ├── five_stage_ring_oscillator.sp    # 5-stage oscillator simulation
│   └── result.png                       # 5-stage simulation results
├── nine_stage_ring_oscillator/
│   ├── nine_stage_ring_oscillator.sp    # 9-stage oscillator simulation
│   └── result.png                       # 9-stage simulation results
├── subcircuits/
│   ├── subcktnand.sp                    # NAND gate subcircuit
│   └── subinv.sp                        # Inverter subcircuit
└── skewed_ring_oscillator_values.png   # Comparative analysis results
```

## ⚙️ Circuit Configurations

### 5-Stage Ring Oscillator
- **Stages**: 5 inverting stages in a closed loop
- **Natural odd number**: Inherently unstable, leading to oscillation
- **Enable Control**: Optional NAND gate for oscillation control

### 9-Stage Ring Oscillator
- **Stages**: 9 inverting stages in a closed loop
- **Higher delay**: Longer propagation path results in lower frequency
- **Enable Control**: Optional NAND gate for oscillation control

## 🔧 Skew Analysis Conditions

The project analyzes three different transistor sizing conditions to understand their impact on oscillator performance:

### 1. Balanced Condition (1:1 Ratio)
- **Wn = Wp**: Equal NMOS and PMOS widths
- **Characteristics**: Symmetric rise and fall times
- **Duty Cycle**: Close to 50%

### 2. High Skew Condition (4:1 Ratio)
- **Wp > Wn**: PMOS width 4 times larger than NMOS
- **Characteristics**: Faster pull-up, slower pull-down
- **Impact**: Affects duty cycle and switching characteristics

### 3. Low Skew Condition (1:4 Ratio)
- **Wp < Wn**: NMOS width 4 times larger than PMOS
- **Characteristics**: Faster pull-down, slower pull-up
- **Impact**: Complementary effect to high skew condition

## 📊 Performance Metrics

For each configuration and skew condition, the following parameters are measured:

### ⏱️ Timing Parameters
1. **Time Period (Tp)**
   - Complete oscillation cycle duration
   - Measured between consecutive rising/falling edges

2. **On Time**
   - Duration when output remains HIGH
   - Affects duty cycle calculation

3. **Duty Cycle**
   - Percentage of time output is HIGH
   - Formula: (On Time / Time Period) × 100%

### ⚡ Power Analysis
4. **Power Consumption**
   - Average power consumed during steady-state oscillation
   - Critical for low-power design considerations

## 📈 Comparative Results

The skewed ring oscillator analysis reveals important design trade-offs:

### 5-Stage vs 9-Stage Comparison
- **Frequency**: 5-stage oscillators have higher frequency due to shorter delay path
- **Power**: Power consumption varies with frequency and transistor sizing
- **Stability**: Both configurations maintain stable oscillation under all skew conditions

### Skew Impact Analysis
- **Balanced (1:1)**: Optimal duty cycle, moderate power consumption
- **High Skew (4:1)**: Modified duty cycle, altered power characteristics
- **Low Skew (1:4)**: Complementary behavior to high skew condition

## 🚀 How to Run the Simulations

### Running 5-Stage Oscillator
```bash
source five_stage_ring_oscillator.sp
```

### Running 9-Stage Oscillator
```bash
source nine_stage_ring_oscillator.sp
```

## 🔑 Design Insights

### Ring Oscillator Applications
1. **⏰ Clock Generation**: Internal timing without external crystals
2. **📊 Process Monitoring**: Characterizing semiconductor variations
3. **🔬 Performance Testing**: Measuring transistor switching speeds
4. **⚡ Power Optimization**: Understanding dynamic power consumption

## 🎯 Applications

This analysis is valuable for:
- **VLSI Design**: Understanding oscillator behavior in different process corners
- **Low-Power Design**: Optimizing power consumption through skew engineering
- **Clock Design**: Generating application-specific clock signals
- **Academic Research**: Teaching digital circuit design principles
