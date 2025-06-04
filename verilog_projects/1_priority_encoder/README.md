# 🔢 4-to-2 Priority Encoder Design

This repository contains Verilog implementations of a 4-to-2 priority encoder using two different design approaches: if-else statements and conditional (ternary) operators with assign statements, complete with testbench verification.

## 🎯 Objective

To design and simulate a 4-to-2 priority encoder using two approaches in Verilog: if-else statements and the conditional (ternary) operator, and verify the output correctness through simulation in Xilinx Vivado.

## 📁 Repository Structure

```
1_priority_encoder/
├── priority_encoder_assign_stmt.v      # Priority encoder using assign & conditional operators
├── priority_encoder_if_else_stmt.v     # Priority encoder using if-else statements
├── tb_priority_encoder.sv              # SystemVerilog testbench
└── result.png                          # Simulation waveform results
```

## 🔬 Design Concept & Theory

### Priority Encoder Fundamentals
- **Function**: Outputs binary representation of highest-priority active input
- **Priority Logic**: Higher-order inputs take precedence over lower-order inputs
- **Output Encoding**: 4 inputs (in[3:0]) → 2-bit output (out[1:0]) + valid signal

### Priority Truth Table
| in[3] | in[2] | in[1] | in[0] | out[1:0] | valid |
|-------|-------|-------|-------|----------|-------|
|   1   |   X   |   X   |   X   |    11    |   1   |
|   0   |   1   |   X   |   X   |    10    |   1   |
|   0   |   0   |   1   |   X   |    01    |   1   |
|   0   |   0   |   0   |   1   |    00    |   1   |
|   0   |   0   |   0   |   0   |    00    |   0   |

## 🛠️ Implementation Approaches

### Method 1: If-Else Statements
- **Structure**: Sequential conditional logic
- **Advantages**: Easy to read and understand
- **Implementation**: Prioritized if-else-if chain
- **File**: `priority_encoder_if_else_stmt.v`

### Method 2: Conditional (Ternary) Operators
- **Structure**: Nested conditional assignments
- **Advantages**: Compact, single-line logic
- **Implementation**: Assign statements with `? :` operators
- **File**: `priority_encoder_assign_stmt.v`


## 🚀 How to Run in Xilinx Vivado

### Prerequisites
- Xilinx Vivado Design Suite installed
- Basic knowledge of Vivado project setup

### Execution Steps

**1. Create New Vivado Project:**
```
File → New Project → RTL Project
```

**2. Add Design Files:**
```
Add Sources → Add or create design sources
- Copy and paste priority_encoder_if_else_stmt.v
- Copy and paste priority_encoder_assign_stmt.v
```

**3. Add Testbench:**
```
Add Sources → Add or create simulation sources
- Copy and paste tb_priority_encoder.sv
```

**4. Run Simulation:**
```
Flow Navigator → Simulation → Run Simulation → Run Behavioral Simulation
```

**5. View Results:**
- Analyze waveforms in simulation window
- Verify priority encoding functionality
- Compare both implementation approaches

### Expected Results
- **Priority Verification**: Highest active input determines output
- **Valid Signal**: Correctly indicates presence of active inputs
- **Timing Analysis**: Both implementations show equivalent functionality
- **Waveform Verification**: Output matches expected priority encoding

