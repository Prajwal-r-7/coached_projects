# 🔍 Sequence Detector - "101" Detection using Mealy Machine

This repository contains a Verilog implementation of a Mealy-type Finite State Machine (FSM) to detect the "101" sequence in a serial input stream with non-overlapping detection behavior.

## 🎯 Objective

To design a **Mealy-type FSM** in Verilog to detect the **"101"** sequence in a serial input stream. The design should be **non-overlapping**, meaning the sequence detection restarts after each successful detection.

## 📁 Repository Structure

```
4_seq_det_101/
├── seq_det_101.v                       # Mealy FSM sequence detector
├── tb_seq_Det_101.sv                   # SystemVerilog testbench
└── result.png                          # Simulation waveform results
```

## 🔬 Design Concept & Theory

### Mealy Machine Fundamentals
- **Output Generation**: Based on **current state** and **input**
- **State Transitions**: Determined by current state and input combinations
- **Non-Overlapping**: FSM resets to idle after sequence detection
- **Sequence Target**: Detect "101" pattern in serial input stream

### State Definition
- **IDLE**: Waiting for first '1' in sequence
- **GOT_1**: Received first '1', waiting for '0'
- **GOT_10**: Received "10", waiting for final '1' to complete "101"

### State Transition Logic
```verilog
// State transitions based on input and current state
IDLE:   input '1' → GOT_1,  input '0' → IDLE
GOT_1:  input '0' → GOT_10, input '1' → GOT_1
GOT_10: input '1' → IDLE (with output), input '0' → IDLE
```

## 🛠️ Implementation Details

### FSM Structure
- **Present State**: Updated on rising clock edge
- **Next State**: Combinational logic based on current state and input
- **Output Logic**: Mealy-type output generation
- **Reset**: Asynchronous reset to IDLE state

### Key Features
- **Input**: `i_a` - serial input stream
- **Output**: `o_y` - high when "101" detected
- **Clock**: `i_clk` - synchronous operation
- **Reset**: `i_rst` - asynchronous reset capability

## 📊 Verification Strategy

### Test Scenarios
- **Valid Sequence**: Input "101" should generate output pulse
- **Invalid Sequences**: Patterns like "100", "110" should not trigger
- **Multiple Detections**: Consecutive "101" patterns
- **Non-Overlapping**: Verify restart after detection

### Expected Results
- **Sequence Detection**: Output pulse on "101" completion
- **State Transitions**: Proper FSM state changes
- **Non-Overlapping**: Return to IDLE after detection
- **Reset Functionality**: Proper initialization on reset

