# 🔄 Single-Stage Inverter with Feedback: Voltage Divider Behavior

This repository contains SPICE simulations analyzing the behavior of a single CMOS inverter with direct feedback, demonstrating why such configurations fail to oscillate and instead stabilize at intermediate voltage levels.

## 🎯 Objective

To analyze the behavior of a single inverter with feedback and understand why it fails to oscillate, instead stabilizing at a fixed intermediate voltage due to voltage divider behavior.

## 📁 Repository Structure

```
single_stage_ring_oscillator/
├── single_stage_ring_oscillator.sp      # Main simulation file
├── result_kick_strt_from0.png           # Results with initial condition at 0V
└── result_kick_strt_from1.png           # Results with initial condition at VDD
```

## 🔬 Concept & Theory

### Why Single-Stage Feedback Fails to Oscillate

A single inverter with direct feedback lacks the fundamental requirements for oscillation:
- **Zero Propagation Delay**: No time delay in the feedback path
- **Simultaneous Conduction**: Both NMOS and PMOS operate in saturation region
- **Voltage Divider Action**: Transistors act as voltage-controlled resistors
- **Stable Equilibrium**: System settles at intermediate voltage (~VDD/2)

### Circuit Configuration
- **PMOS**: W = 20 µm, L = 0.18 µm
- **NMOS**: W = 10 µm, L = 0.18 µm
- **Connection**: Output directly fed back to input
- **Self-Biasing**: No external input signal applied

### Simulation Parameters
- **Analysis Type**: Transient analysis with two initial conditions
- **Initial Condition 1**: Node voltage starts at 0V
- **Initial Condition 2**: Node voltage starts at VDD
- **Expected Result**: Both conditions converge to same equilibrium voltage

## 🚀 How to Run the Simulation

### Prerequisites
- NGSpice installed on your system

### Execution Steps
```bash
source single_stage_ring_oscillator.sp
```

## 📈 Key Observations

### Expected Results
- **No Oscillation**: Circuit stabilizes at fixed voltage level
- **Initial Condition Independence**: Both starting points converge to same final voltage
- **Static Power Consumption**: Continuous current path from VDD to ground
- **Equilibrium Voltage**: Approximately VDD/2 for given transistor sizing
