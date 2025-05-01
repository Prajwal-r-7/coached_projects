# 📘 NMOS & PMOS Drain and Transfer Characteristics

This repository contains NGSpice simulations for analyzing the **drain** and **transfer** characteristics of **NMOS** and **PMOS** transistors. These simulations help visualize the relationship between drain current (ID) and voltage parameters (VDS and VGS), which is fundamental to understanding MOSFET behavior.

## 📊 Simulated Characteristics

The following characteristics are covered for both NMOS and PMOS:

- **Drain Characteristics**:  
  - Plot of **ID vs VDS** at various VGS values
  - Shows linear and saturation regions
  
- **Transfer Characteristics**:  
  - Plot of **ID vs VGS** at constant VDS
  - Demonstrates threshold voltage and device turn-on

## 🛠️ Technology Details

- **Process**: 180nm technology
- **Transistor Dimensions**: W=10μm, L=0.18μm
- **Supply Voltage**: 1.5V
- **Models**: BSIM4 SOI models

## 📁 Files Included

- `nmos.sp` - NMOS drain and transfer characteristics
- `pmos.sp` - PMOS drain and transfer characteristics

## 🚀 How to Run the Simulations

1. **Install NGSpice** (version 44.2 or compatible):  
   [https://ngspice.sourceforge.io/](https://ngspice.sourceforge.io/)
   
2. **Run simulation using terminal**:
   ```bash
   ngspice nmos.sp
   ngspice pmos.sp
   ```

3. **Viewing Results**:
   - Use built-in NGSpice plotting interface
   - Export data for external plotting if needed

## 📝 Key Observations

- Monitor threshold voltage 
- Compare linear vs. saturation regions
- Observe channel length modulation effects (short channel effect)

---

<p align="center">
  <i>Created by Prajwal | VLSI Design Projects</i>
</p>
