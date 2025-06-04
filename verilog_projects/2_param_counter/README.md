# 🔢 Parameterized Counter Design

This repository contains a flexible Verilog implementation of a parameterized counter with automatic bit-width calculation, designed for modulo-100000 operation using the $clog2 function for optimal resource utilization.

## 🎯 Objective

To design a **modulo-100000 counter** using a parameterized approach in Verilog, leveraging the $clog2 function for automatic bit-width calculation based on the counter size, enabling flexible and scalable counter implementations.

## 📁 Repository Structure

```
2_param_counter/
├── param_counter.v                     # Parameterized counter module
├── tb_param_counter.sv                 # SystemVerilog testbench
└── result.png                          # Simulation waveform results
```

## 🔬 Design Concept & Theory

### Parameterized Counter Fundamentals
- **Counter Operation**: Increments value with each clock pulse
- **Modulo Behavior**: Resets to 0 after reaching specified maximum value (MOD)
- **Parameter Flexibility**: Configurable counter range through parameter definition
- **Bit-Width Optimization**: Automatic calculation of required output bits

### Key Design Features
- **Parameter MOD**: Defines maximum count value (default: 100000)
- **Dynamic Bit-Width**: Uses `$clog2(MOD)` for optimal register width
- **Reset Functionality**: Synchronous reset capability
- **Wrap-Around Logic**: Automatic rollover from MOD-1 to 0

### $clog2 Function Benefits
- **Automatic Sizing**: Computes minimum bits needed for count range
- **Resource Optimization**: Prevents over-allocation of flip-flops
- **Scalability**: Easy modification for different counter ranges
- **Design Efficiency**: Reduces manual bit-width calculations

## 🛠️ Implementation Details

### Bit-Width Calculation
- **MOD = 100000**: Requires $clog2(100000) = 17 bits
- **Range**: 0 to 99999 (100000 states)
- **Optimization**: Exactly 17 bits instead of arbitrary 32-bit width

### Expected Results
- **Counter Increment**: Sequential counting from 0 to 99999
- **Reset Operation**: Immediate return to 0 when reset asserted
- **Wrap-Around**: Automatic rollover from 99999 to 0
- **Timing Verification**: Proper synchronous operation

### Possible Extensions
- **Up/Down Counter**: Bidirectional counting capability
- **Load Functionality**: Preset counter to specific value
- **Enable Control**: Conditional counting operation
- **Multiple Outputs**: Decode specific count values

### Parameter Variations
```verilog
// Different modulo values
parameter MOD = 1000;    // 10-bit counter
parameter MOD = 256;     // 8-bit counter  
parameter MOD = 60;      // 6-bit counter (seconds)
parameter MOD = 24;      // 5-bit counter (hours)
```

