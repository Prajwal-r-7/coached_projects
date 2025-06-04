# ⚡ Pulsed Flip-Flop Design

This repository contains SPICE simulations for a pulsed flip-flop design using a custom pulse generator and high latch configuration to achieve rising edge-triggered operation with optimized timing characteristics.

## 🎯 Objective

To design and analyze a pulsed flip-flop using a pulse generator with 100ps ON time and 10% duty cycle, combined with a high latch to form a rising edge-triggered flip-flop with improved performance over conventional designs.

## 📁 Repository Structure

```
8_pulsed_flipflop/
├── pulse_generator/
│   ├── pulse_generator.sp               # Pulse generator simulation
│   ├── subcircuits/
│   │   ├── suband.sp                   # AND gate subcircuit
│   │   ├── subcktnand.sp               # NAND gate subcircuit
│   │   ├── subinv.sp                   # Inverter subcircuit
│   │   └── subpulsegen.sp              # Pulse generator subcircuit
│   ├── circuit.png                     # Pulse generator circuit diagram
│   └── result.png                      # Pulse generator results
└── pulsed_flip_flop/
    ├── pulsed_flipflop.sp              # Complete pulsed flip-flop
    ├── subcircuits/
    │   ├── subhilatch.sp               # High latch subcircuit
    │   └── subpulsegen.sp              # Pulse generator subcircuit
    ├── circuit.png                     # Flip-flop circuit diagram
    └── result.png                      # Flip-flop simulation results
```

## 🔬 Design Concept & Theory

### Pulsed Flip-Flop Architecture
- **Pulse Generator**: Creates narrow pulses from clock edges using delay-based timing
- **High Latch**: Level-sensitive latch that captures data during pulse width
- **Edge Triggering**: Rising edge of clock triggers pulse generation

### Pulse Generator Design
- **Implementation**: AND gate with 3-stage inverter delay chain
- **Timing Method**: Exploits propagation delay difference between direct and delayed paths
- **Target Specifications**:
  - **ON Time (Ton)**: 100ps
  - **Duty Cycle**: 10% of clock period
  - **Edge Response**: Rising edge triggered

### Circuit Operation
1. **Clock Rising Edge**: Initiates pulse generation
2. **Delay Chain**: 3-stage inverter creates 100ps delay
3. **AND Gate Logic**: Combines original and delayed clock signals
4. **Pulse Output**: Narrow pulse with 100ps width
5. **Latch Operation**: High latch captures data during pulse period

## 🚀 How to Run the Simulations

### Prerequisites
- NGSpice installed on your system
- Access to all subcircuit files

### Execution Steps

**Pulse Generator Analysis:**
```bash
source pulse_generator.sp
```

**Complete Pulsed Flip-Flop:**
```bash
source pulsed_flipflop.sp
```

### Expected Results
- **Pulse Generator**: 100ps pulse width with proper timing
- **Flip-Flop**: Edge-triggered data capture with pulse-controlled operation
