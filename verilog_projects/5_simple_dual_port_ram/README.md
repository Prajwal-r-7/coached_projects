# 🧠 Simple Dual Port RAM (32-bit, 1024-depth)

This repository contains a Verilog implementation of a simple dual-port RAM using Vivado's IP Catalog with independent read and write ports, supporting simultaneous access through different addresses.

## 🎯 Objective

To implement a **simple dual-port RAM** using Vivado's IP Catalog with **independent read and write ports**, supporting simultaneous access through different clocks or addresses with 32-bit data width and 1024 memory locations.

## 📁 Repository Structure

```
simple_dual_port_ram/
├── dual_port_ram_wrapper.v            # Wrapper module with IP instantiation
├── mem_sdpr.xci                       # IP core configuration file
├── tb_dual_port_ram.v                 # Testbench for verification
└── result.png                         # Simulation waveform results
```

## 🔬 Design Concept & Theory

### Dual Port RAM Fundamentals
- **Dual-port RAM** allows reading and writing to/from memory at different addresses **simultaneously**
- **Port A**: Dedicated for writing operations with independent address and control
- **Port B**: Dedicated for reading operations with independent address and control
- **Simultaneous Access**: Both ports can operate concurrently without conflicts

### Memory Configuration
- **Data Width**: 32 bits per memory location
- **Memory Depth**: 1024 locations (10-bit address space)
- **Address Range**: 0 to 1023 (2^10 - 1)
- **Total Capacity**: 32 KB (32 bits × 1024 locations)

### Port Configuration
- **Port A (Write Port)**:
  - `ena`: Enable signal for Port A
  - `wea`: Write enable for Port A
  - `addra[9:0]`: 10-bit address for write operations
  - `dina[31:0]`: 32-bit data input
- **Port B (Read Port)**:
  - `i_rd_en`: Read enable signal
  - `i_rd_addr[9:0]`: 10-bit address for read operations
  - `o_dout[31:0]`: 32-bit data output

## 🛠️ Implementation Details

### IP Core Integration
- **IP Core**: Block Memory Generator (mem_sdpr) from Vivado IP Catalog
- **Memory Type**: Simple Dual Port RAM configuration
- **Wrapper Module**: Custom Verilog wrapper for system integration
- **Instantiation**: Direct IP core instantiation using .veo template

## 📋 Vivado IP Catalog Setup Steps

### IP Generation Process
1. **Create Project**: Open Vivado and create new RTL project
2. **Access IP Catalog**: Navigate to IP Catalog in Flow Navigator
3. **Search Memory**: Search for "Memory Generators" in IP Catalog
4. **Select Block Memory**: Choose "Block Memory Generator" IP
5. **Configure Component**:
   - Set component name (e.g., "mem_sdpr")
   - Select "Simple Dual Port RAM" as memory type
6. **Port Configuration**:
   - **Port A**: Set width to 32 bits, depth to 1024
   - **Port B**: Configure with same specifications
7. **Generate IP**: Click OK to generate IP core files
8. **Integration**: Copy instantiation template from `mem_<component_name>.veo` file

### File Integration
- Locate generated `.veo` file in IP Sources
- Copy INSTANTIATION template into main design file
- Connect wrapper module signals to IP core ports
- Add custom control logic as required

