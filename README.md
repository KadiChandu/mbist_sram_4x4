# MBIST - 4x4 SRAM Tested with March C- Algorithm
This project implements a **Memory Built-In Self-Test (MBIST)** architecture for a **4x4-bit SRAM** using the **March C- algorithm**
## What is MBIST?
**MBIST (Memory Built-In Self-Test)** is a self-testing technique used to test embedded memories (like SRAM, DRAM) in digital systems. Instead of using expensive external test equipment, the system tests itself using internally built test controllers.
## Objective
-  Create a 4x4-bit SRAM using flip-flop based memory cells.
-  Implement a March C- algorithm to test for memory faults.
-  Use a FSM (Finite State Machine) to automatically run the test sequence.
-  Compare expected and actual values using a comparator module.
-  Indicate whether the memory passed or failed the test. 
## What is March C- Algorithm?
The **March C- algorithm** is a deterministic memory test pattern used in BIST for fault detection. It works by writing and reading memory cells in a specific pattern and order.
This sequence helps in detecting:
- Stuck-at Faults
- Transition Faults
- Coupling Faults
## Output 
- If match = 1, the SRAM passed the MBIST test.
- If match = 0, one or more errors were detected
