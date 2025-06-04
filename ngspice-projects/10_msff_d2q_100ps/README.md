# ⚡ MSFF 100ps Timing Optimization

This repository contains SPICE simulations for achieving optimized timing performance in a Master-Slave Flip-Flop (MSFF) design through strategic transistor sizing to achieve setup + CLK→Q delay of approximately 100ps.

## 🎯 Objective

To achieve setup + CLK→Q ≈ 100ps timing performance in a Master-Slave Flip-Flop through systematic transistor sizing optimization at delay-critical nodes, balancing speed, power, and stability requirements.

## 📁 Repository Structure

```
msff_d2q_100ps/
├── msff_d2q_100ps.sp                   # Optimized MSFF simulation
├── circuit.png                         # MSFF circuit diagram
└── result.png                          # Timing optimization results
```

## 🔬 Design Concept & Theory

### Timing Optimization Strategy
- **Target Performance**: Setup + CLK→Q ≈ 100ps
- **Optimization Method**: Strategic transistor sizing at delay-critical nodes
- **Design Balance**: Speed vs Power vs Stability trade-offs

### Critical Timing Paths
- **Setup Time**: Data propagation through master transmission gate
- **CLK→Q Delay**: Clock-to-output propagation through slave stage
- **Total Delay**: Combined setup and propagation delay optimization

## 🔧 Transistor Sizing Strategy

### Master Transmission Gate (MN1, MP1)
- **Size**: Increased to **80μm width**
- **Purpose**: Reduce transmission gate resistance
- **Impact**: 
  - Faster data transfer to intermediate node
  - Reduced setup time requirement
  - Earlier data arrival at slave stage

### Slave Transmission Gate (MN5, MP5)
- **Size**: Maintained at **10μm width**
- **Rationale**: Prevent contention with keeper circuit
- **Benefits**:
  - Avoid output transition slowdown
  - Minimize power consumption
  - Maintain stable operation

### Slave Keeper Inverter (MN6, MP6)
- **Size**: Reduced to **5μm width**
- **Purpose**: Weaken feedback strength at slave output
- **Impact**:
  - Faster output transitions during clock edges
  - Improved CLK→Q delay performance
  - Reduced hold strength for quicker state changes

### Keeper Circuits (MP3-MP4, MN3-MN4)
- **Size**: Minimized for stability
- **Function**: Maintain internal node stability
- **Design Goals**:
  - Stable data retention during clock transitions
  - Adequate feedback for state holding
  - Minimal interference with switching speed

## 🚀 How to Run the Simulation

### Prerequisites
- NGSpice installed on your system
- Access to transistor model files

### Execution Steps

**Run Optimized MSFF Simulation:**
```bash
source msff_d2q_100ps.sp
```

### Expected Results
- **Setup + CLK→Q**: Approximately 100ps total delay
- **Timing Waveforms**: Optimized transition characteristics
- **Performance Metrics**: Improved speed with maintained stability

## 📊 Key Optimization Results

### Timing Improvements
- **Master Stage**: Reduced setup time through enlarged transmission gates
- **Slave Stage**: Improved CLK→Q delay via weakened keeper feedback
- **Overall**: Balanced 100ps total timing performance

