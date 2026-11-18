# Robotiq Hand-E Adaptive Gripper & UR CB Coupling

Official vendor **STEP** models and converted **STL** meshes for the **Robotiq Hand-E** parallel gripper (`50 mm` stroke) and the **UR CB-Series I/O Coupling** (`ISO 9409-1-50-4-M6`).

---

## Folder Structure

```text
robotiq-hand-e/
├── README.md
├── step/
│   ├── io_coupling_ur_cb.step        # UR CB-Series mechanical & electrical coupling
│   ├── hand_e_no_fingertips.step     # Main gripper body with sliding jaw holders
│   └── hand_e_fingertip.step         # Single symmetrical fingertip (use ×2, second rotated 180°)
└── stl/
    ├── io_coupling_ur_cb.stl
    ├── hand_e_no_fingertips.stl
    └── hand_e_fingertip.stl
```

---

## Key Mechanical Specifications

| Component | Parameter | Specification | Notes |
| :--- | :--- | :--- | :--- |
| **Hand-E Gripper Body** | **Stroke** | **50.0 mm** (`25.0 mm` per jaw) | Parallel linear jaw travel (`0` to `50.0 mm` opening with standard fingertips) |
| | **Grip Force** | **20 N – 130 N** | Programmable force control |
| | **Payload (Form-Fit / Friction)** | **5.0 kg** / **3.0 kg** | Recommended maximum payload |
| | **Outer Diameter / Weight** | **Ø 75.0 mm** / **~1.0 kg** | Compact cylindrical housing |
| **Fingertip Interface** | **Mounting Pattern (Per Jaw)** | **2 × M3** screws + alignment slot | Both left and right fingertips are identical (`hand_e_fingertip.step` rotated **180°** around Z for the second jaw) |
| **UR CB I/O Coupling** | **Robot Flange Standard** | **ISO 9409-1-50-4-M6** | **Ø 50.0 mm** BCD (`4 × M6` bolts + `Ø 6.0 mm` dowel pin) |
| | **Electrical Interface** | **M12** side connector | Connects gripper power & RS-485/I/O directly to UR5 CB3 wrist |

---

## UR5 Wrist Stack Order

When combining this gripper with the **[UR5 Adjustable Camera Mount](../ur5-camera-mount/)**, stack the components on the UR5 wrist in the following order:

1. **UR5 Tool Flange** (`ISO 9409-1-50-4-M6`)
2. **Camera Mount Housing (`Part 1`)** (`22.0 mm` collar + `8.0 mm` male pilot boss)
3. **Robotiq UR CB I/O Coupling** (`io_coupling_ur_cb.step`)
4. **Robotiq Hand-E Gripper Body** (`hand_e_no_fingertips.step`)
5. **2 × Fingertips** (`hand_e_fingertip.step` at `0°` and `180°`)
