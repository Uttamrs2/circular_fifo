# circular_fifo
# Circular FIFO Buffer 

## 📌 Overview

This project implements a **Circular FIFO (First-In-First-Out)** buffer using Verilog. The FIFO is designed to store and retrieve data in a queue-like structure with constant time operations. It uses **circular addressing** to efficiently reuse memory, making it ideal for buffering data in hardware applications.

---

## 🧠 Key Concepts

- **FIFO Depth**: Configurable number of entries (default: 16 or 32).
- **Circular Buffer**: Wrap-around logic when pointer reaches the end.
- **Two Pointers**:
  - `write_ptr` (enqueue data)
  - `read_ptr` (dequeue data)
- **Status Flags**:
  - `full`, `empty`, `almost_full`, `almost_empty` (optional)
