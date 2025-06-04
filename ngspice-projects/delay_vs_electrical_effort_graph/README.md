# 📊 Delay vs Electrical Effort (Co/Cin) Analysis

This repository contains SPICE simulations for analyzing the delay characteristics of various logic gates (Inverter, NAND2, NOR2, NAND3, NOR3) as a function of electrical effort (Co/Cin ratio) to understand load-dependent timing behavior and optimize circuit performance.

## 🎯 Objective

To characterize and compare the delay vs electrical effort relationship across different logic gates, establish balanced rise/fall delays through optimal transistor sizing, and analyze the relative performance of complex gates compared to the inverter baseline.

## 📁 Repository Structure

```
delay_vs_electrical_effort_graph/
├── subcircuits/
│   ├── subinv.sp                       # Inverter subcircuit
│   ├── subcktnand.sp                   # NAND2 subcircuit
│   ├── subcktnor.sp                    # NOR2 subcircuit
│   ├── subnand3.sp                     # NAND3 subcircuit
│   └── subnor3.sp                      # NOR3 subcircuit
├── inverter.sp                         # Inverter simulation
├── nand2.sp                           # NAND2 gate simulation
├── nor2.sp                            # NOR2 gate simulation
├── nand3.sp                           # NAND3 gate simulation
├── nor3.sp                            # NOR3 gate simulation
├── values.png                         # Measured delay values
└── result.png                         # Complete analysis graph
```

## 🔬 Design Concept & Theory

### Electrical Effort Fundamentals
- **Electrical Effort (h)**: Co/Cin ratio representing load capacitance to input capacitance
- **Delay Model**: Total delay = Parasitic delay + Effort-dependent delay
- **Linear Relationship**: Delay increases linearly with electrical effort for well-designed gates

### Transistor Sizing Strategy
- **Balanced Design**: Wp/Wn = 2 for equal rise and fall delays
- **Inverter Reference**: Wp = 20μm, Wn = 10μm (RpC ≈ RnC)
- **Consistent Sizing**: Same Wp/Wn ratio maintained across all gate types

### Gate Complexity Analysis
- **Series Resistance**: NAND gates have stacked NMOS (higher fall delay)
- **Parallel Resistance**: NOR gates have stacked PMOS (higher rise delay)
- **Stack Effect**: 3-input gates show more pronounced delay asymmetry than 2-input gates

## 📈 Key Analysis Results

### Inverter Baseline Characteristics
- **Linear Response**: Clean linear relationship between delay and Co/Cin
- **Balanced Delays**: Single curve due to matched rise/fall times
- **Reference Standard**: All other gates compared against inverter performance

### Relative Gate Performance

**Above Inverter Curve (Slower):**
- **NAND2 (fall)** ≈ **NOR2 (rise)**: 2RC delay characteristic
- **NAND3 (fall)** ≈ **NOR3 (rise)**: 3RC delay characteristic
- **Ordering**: NAND2(fall) ≈ NOR2(rise) < NAND3(fall) ≈ NOR3(rise)

**Below Inverter Curve (Faster):**
- **NAND2 (rise)** ≈ **NOR2 (fall)**: RC/2 delay characteristic  
- **NAND3 (rise)** ≈ **NOR3 (fall)**: RC/3 delay characteristic
- **Ordering**: NAND2(rise) ≈ NOR2(fall) < NAND3(rise) ≈ NOR3(fall)


## 🚀 How to Run the Simulations

### Prerequisites
- NGSpice installed on your system
- Access to all subcircuit files

### Execution Steps

**Individual Gate Analysis:**
```bash
source inverter.sp
source nand2.sp
source nor2.sp
source nand3.sp
source nor3.sp
```

**Complete Characterization:**
Run all simulations and compile results for comparative analysis.

## 📊 Performance Insights

### Critical Limitations
- **NOR3 Degradation**: Output swing issues at high electrical effort (Co/Cin ≥ 3)
- **Stack Penalties**: 3-input gates show significant worst-case delay increases
- **Power Trade-offs**: Larger transistors improve speed but increase power consumption

## 🎯 Key Design Takeaways

### Gate Hierarchy Performance
1. **Fastest**: Simple gates with favorable switching direction
2. **Baseline**: Inverter with balanced characteristics
3. **Moderate**: 2-input complex gates
4. **Slowest**: 3-input complex gates with unfavorable switching

### Electrical Effort Guidelines
- **Optimal Range**: Co/Cin = 1-4 for most applications
- **Performance Cliff**: Significant degradation beyond Co/Cin = 4
- **Gate-Specific Limits**: Complex gates more sensitive to loading effects