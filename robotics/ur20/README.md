# Universal Robots UR20 Collaborative Robot Arm

Official **STEP** CAD assembly and **STL** mesh for the **Universal Robots UR20** (`1750 mm` reach, `20 kg` payload, **ISO 9409-1-80-6-M8** tool flange).

---

## Folder Structure

```text
ur20/
├── README.md
├── universal-robots.com_legal_terms_and_conditions_for_use_of_graphical_documentation.txt
├── step/
│   └── UR20.step
└── stl/
    └── UR20.stl
```

---

## Mechanical Specifications

| Parameter | Specification | Notes |
| :--- | :--- | :--- |
| **Max Reach / Payload** | **1750 mm** / **20 kg** | **64 kg** arm weight |
| **Base Mounting Pattern** | **6 × M10** + **2 × Ø 8.0 mm** dowels on **Ø 218.0 mm** PCD | Matches the top deck hole pattern of `workcells/ur-steel-pedestal/` |
| **Tool Flange Interface** | **ISO 9409-1-80-6-M8** (`Ø 80 mm` PCD, `6 × M8`, `Ø 8 mm` index pin) | Connects directly to `robotics/vention-iso50-to-iso80-adaptor/` |

---

## Compatible Parts in This Repository

* **[JUGARD+KÜNSTNER Steel Robot Pedestal](../../workcells/ur-steel-pedestal/):** `780 × 780 × 815 mm` pedestal with matching `6 × M10` UR20 base bolt pattern (`ur20_pedestal_assembly.stl`).
* **[Vention ISO 50 to ISO 80 Tool Flange Adaptor](../vention-iso50-to-iso80-adaptor/):** Converts the UR20 `ISO 9409-1-80-6-M8` tool flange to `ISO 9409-1-50-4-M6` for the Robotiq Hand-E and camera mount.

---

## License & Attribution

© 2023 Universal Robots A/S. Use hereof is subject to Universal Robots A/S’ Terms and Conditions for Use of Graphical Documentation. See [`universal-robots.com_legal_terms_and_conditions_for_use_of_graphical_documentation.txt`](universal-robots.com_legal_terms_and_conditions_for_use_of_graphical_documentation.txt) for full terms.
