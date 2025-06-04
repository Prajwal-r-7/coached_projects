# ⚡ Rising and Falling Edge Detector

This repository contains a Verilog implementation of rising and falling edge detector circuits with SystemVerilog testbench using randomized input testing for comprehensive verification.

## 🎯 Objective

To design a Verilog module that detects the **rising edge** and **falling edge** of a digital signal, and test it using a **SystemVerilog testbench** that applies randomized inputs using the $urandom function.

## 📁 Repository Structure

```
3_edge_detector/
├── edge_detector.v                     # Edge detector module
├── tb_edge_detector.sv                 # SystemVerilog testbench with random inputs
└── result.png                          # Simulation waveform results
```

## 🔬 Design Concept & Theory

### Edge Detection Fundamentals
- **Rising Edge**: Transition from 0 to 1 (low to high)
- **Falling Edge**: Transition from 1 to 0 (high to low)
- **Detection Method**: Compare current and previous signal states
- **Storage Requirement**: Register to hold previous state value

### Edge Detection Logic
- **Rising Edge**: `rise_edge = ~prev & current`
- **Falling Edge**: `fall_edge = prev & ~current`
- **State Storage**: Previous value stored in register updated each clock cycle
- **Reset Handling**: Asynchronous reset for proper initialization

### Key Features
- **Input Signal**: `i_a` - signal to be monitored
- **Clock**: `i_clk` - synchronous operation
- **Reset**: `i_rst` - asynchronous reset capability
- **Outputs**: Separate rising and falling edge indicators

## 📊 Verification Strategy

### Random Testing Approach
- **$urandom Function**: Generates pseudo-random input patterns
- **Comprehensive Coverage**: Tests various edge scenarios
- **Timing Verification**: Validates edge detection at different intervals
- **Reset Testing**: Confirms proper initialization behavior

### Expected Results
- **Rising Edge Detection**: Pulse generated on 0→1 transitions
- **Falling Edge Detection**: Pulse generated on 1→0 transitions
- **No False Triggers**: Stable signals produce no edge outputs
- **Reset Functionality**: Proper initialization on reset assertion

