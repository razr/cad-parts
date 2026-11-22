# Universal Robots UR20 Collaborative Robot Arm & Controller Hardware

Official **STEP** CAD models and **STL** meshes for the **Universal Robots UR20** (`1750 mm` reach, `20 kg` payload, **ISO 9409-1-80-6-M8** tool flange), **CB5.6 Control Box**, **3PE Teach Pendant**, and base **mounting bolt**.

---

## Folder Structure

```text
ur20/
├── README.md
├── universal-robots.com_legal_terms_and_conditions_for_use_of_graphical_documentation.txt
├── step/
│   ├── UR20.step                 # UR20 robot arm assembly
│   ├── CB5.6_simplified.step     # CB5.6 / e-Series Control Box (IP44 enclosure)
│   ├── 3PE_TPe-Series.step       # 3PE Teach Pendant (PolyScope HMI with 3-position enabling switch)
│   └── mounting-bolt.step        # Base mounting hardware
└── stl/
    ├── UR20.stl
    ├── CB5.6_simplified.stl
    ├── 3PE_TPe-Series.stl
    └── mounting-bolt.stl
```

---

## Components Included

| File | Description | Key Specifications |
| :--- | :--- | :--- |
| **`UR20.step`** | **UR20 Manipulator Arm** | **1750 mm** reach, **20 kg** payload, **64 kg** weight, **ISO 9409-1-80-6-M8** tool flange, **6 × M10 + 2 × Ø 8 mm** base pattern on **Ø 218 mm** PCD |
| **`CB5.6_simplified.step`** | **CB5.6 Control Box** | **460 × 254 × 449 mm** (`W × D × H`) IP44 steel enclosure (`~12 kg`) |
| **`3PE_TPe-Series.step`** | **3PE Teach Pendant** | **294 × 192 × 56 mm** touchscreen HMI with integrated 3-position enabling switch (`~1.6 kg`) |
| **`mounting-bolt.step`** | **Base Mounting Bolt** | Standard base fastening hardware |

---

## Compatible Parts in This Repository

* **[JUGARD+KÜNSTNER Steel Robot Pedestal](../../workcells/ur-steel-pedestal/):** `780 × 780 × 815 mm` pedestal with matching `6 × M10` UR20 base bolt pattern (`ur20_pedestal_assembly.stl`).
* **[Vention ISO 50 to ISO 80 Tool Flange Adaptor](../vention-iso50-to-iso80-adaptor/):** Converts the UR20 `ISO 9409-1-80-6-M8` tool flange to `ISO 9409-1-50-4-M6` for the Robotiq Hand-E and camera mount.

---

## License & Attribution

© 2023 Universal Robots A/S. Use hereof is subject to Universal Robots A/S’ Terms and Conditions for Use of Graphical Documentation. See [`universal-robots.com_legal_terms_and_conditions_for_use_of_graphical_documentation.txt`](universal-robots.com_legal_terms_and_conditions_for_use_of_graphical_documentation.txt) for full terms.
