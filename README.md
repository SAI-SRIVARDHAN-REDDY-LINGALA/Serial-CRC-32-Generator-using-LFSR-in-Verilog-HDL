# Serial CRC-32 Generator using LFSR in Verilog HDL

## Overview

This project implements a fully synthesizable **Serial CRC-32 Generator** using an **LFSR (Linear Feedback Shift Register)** architecture in Verilog HDL.

The design demonstrates one of the most important real-world digital design concepts used in modern communication and storage systems.

The implementation combines:

- Sequential logic
- XOR combinational logic
- Shift register architecture
- Polynomial arithmetic
- Error detection systems
- Streaming serial data processing

The CRC engine processes:

```text
1 bit per clock cycle
```

using the standard CRC-32 polynomial.

---

# Features

- CRC-32 implementation
- Serial bit-by-bit processing
- LFSR-based architecture
- Standard CRC-32 polynomial support
- Fully synthesizable RTL
- FPGA/ASIC friendly design
- Shift-register-based polynomial division
- Error detection architecture
- Streaming data support
- Testbench verification

---

# Technologies Used

- Verilog HDL
- Sequential Logic Design
- LFSR Architecture
- XOR Feedback Logic
- RTL Design Methodology
- Digital Communication Concepts
- FPGA-Oriented Design

---

# What is CRC?

CRC stands for:

```text
Cyclic Redundancy Check
```

It is an error detection technique used to identify corrupted data during transmission or storage.

CRC is widely used in:

- Ethernet
- USB
- PCIe
- SATA
- Storage Systems
- FPGA Communication Links
- Networking Protocols

---

# Why CRC is Needed

When data travels through:

- PCB traces
- USB cables
- Ethernet links
- Wireless channels

noise and interference can flip bits.

Example:

```text
Original : 10110011
Received : 10100011
```

CRC helps detect these transmission errors.

---

# CRC Communication Flow

```text
Data
  ↓
CRC Generator
  ↓
Transmit Data + CRC
  ↓
Receiver
  ↓
CRC Checker
  ↓
Error Detection
```

If the computed CRC does not match:

```text
Transmission Error Detected
```

---

# CRC-32 Polynomial

The design uses the standard CRC-32 polynomial:

```text
0x04C11DB7
```

Polynomial form:

```text
x^32 + x^26 + x^23 + x^22 + x^16
+ x^12 + x^11 + x^10
+ x^8 + x^7 + x^5 + x^4 + x^2 + x + 1
```

The polynomial determines:

- XOR tap locations
- Feedback behavior
- Error detection strength

---

# CRC as Polynomial Division

CRC mathematically performs:

```text
DATA ÷ POLYNOMIAL
```

The remainder becomes the CRC value.

Hardware does not perform traditional long division.

Instead, the division is implemented efficiently using:

```text
LFSR + XOR feedback
```

---

# What is an LFSR?

LFSR stands for:

```text
Linear Feedback Shift Register
```

An LFSR consists of:

- Flip-flops
- XOR feedback paths
- Shift registers

Each clock cycle:

- Bits shift through registers
- Feedback modifies selected stages
- Polynomial division is emulated

---

# CRC-32 Architecture

```text
                +------------------+
data_in ------->| XOR feedback     |
                +--------+---------+
                         |
                         v
 +------------------------------------------------+
 | 32-bit Shift Register (crc_out[31:0])          |
 +------------------------------------------------+
                         ^
                         |
                  Polynomial XOR taps
```

---

# Core CRC Logic

## Feedback Generation

```text
feedback = crc[31] XOR data_in
```

The incoming serial bit is XORed with the CRC MSB.

---

# CRC Update Operation

Each clock cycle:

1. Compute feedback
2. Shift CRC register
3. Apply polynomial XOR if feedback = 1

Equivalent RTL behavior:

```text
if(feedback)
    crc = (crc << 1) ^ POLY;
else
    crc = (crc << 1);
```

---

# Why XOR is Used

CRC operates using:

```text
Modulo-2 arithmetic
```

In modulo-2 arithmetic:

```text
1 + 1 = 0
```

which is exactly XOR behavior.

This makes CRC extremely hardware-efficient.

---

# Serial CRC Processing

The design processes:

```text
1 bit per clock
```

Data flow:

```text
Incoming Bit
      ↓
Feedback Generation
      ↓
Shift Register Update
      ↓
Polynomial XOR
      ↓
Updated CRC
```

---

# Waveform Verification

Simulation waveforms showed CRC transitions such as:

```text
FFFF_FFFF
FFFF_FFFE
FB3E_E24B
F67D_C496
```

This confirms:

- Shift register operation
- XOR feedback activity
- Correct polynomial application
- Dynamic CRC evolution

---

# Testbench Verification

A dedicated Verilog testbench was developed to verify:

- Reset behavior
- Serial bit injection
- CRC register updates
- Polynomial XOR logic
- Sequential CRC evolution

---

# Reset Behavior

The CRC register initializes to:

```text
FFFFFFFF
```

This matches common CRC-32 standards used in Ethernet and networking systems.

---

# Hardware Concepts Demonstrated

- Sequential Logic
- Shift Registers
- XOR Networks
- Polynomial Arithmetic
- Error Detection Systems
- Streaming Data Processing
- LFSR Design
- RTL Architecture
- Hardware-Friendly Algorithms

---

# Skills Demonstrated

- Verilog HDL
- RTL Design
- LFSR Architecture
- CRC Algorithm Implementation
- Sequential Circuit Design
- FPGA-Oriented RTL
- Communication System Concepts
- Hardware Verification
- Testbench Development
- Digital System Design

---

# Real-World Applications

CRC architectures are heavily used in:

- Ethernet MACs
- USB Controllers
- PCIe Links
- SATA Interfaces
- Storage Devices
- Networking Hardware
- FPGA Communication Systems
- Embedded Protocol Engines

---

# Serial vs Parallel CRC

## Serial CRC

### Advantages

- Small hardware area
- Simple RTL
- Low resource usage

### Disadvantages

- Slower throughput
- 1-bit-per-cycle operation

---

## Parallel CRC

High-speed systems often use:

- 8-bit CRC
- 32-bit CRC
- 64-bit CRC

per clock cycle for multi-gigabit communication systems.

---

# Engineering Importance

CRC is one of the most fundamental hardware algorithms used in digital communication systems.

The project demonstrates:

- Hardware polynomial division
- Streaming data processing
- Error detection architectures
- Efficient RTL implementation techniques

---

# Industry Relevance

This design reflects concepts used in:

- Communication Protocol Hardware
- FPGA Networking Systems
- ASIC Data Integrity Engines
- Ethernet Controllers
- High-Speed Interconnect Systems
- Embedded Communication SoCs

---

# Key Takeaways

- CRC is hardware-based polynomial division
- LFSRs efficiently implement CRC logic
- XOR implements modulo-2 arithmetic
- CRC provides powerful error detection
- Shift-register architectures are ideal for streaming data
- Serial CRC minimizes hardware area
- CRC is fundamental in communication hardware systems

---

# Final Core Idea

```text
Shift Register
+
XOR Feedback
+
Polynomial Taps
=
Hardware Polynomial Divider
```

This single concept explains the complete CRC architecture.

---

# Author

**Sai Srivardhan Lingala**  
Electronics Engineering Student | FPGA & Digital Design Enthusiast
