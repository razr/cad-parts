# Universal Robots Wrist & Tool Accessories

Parametric **OpenSCAD** models and ready-to-print **STL** files for Universal Robots e-Series (`UR3e`, `UR5e`, `UR10e`, `UR16e`) wrist accessories and protective caps.

---

## Folder Structure

```text
ur-accessories/
├── README.md
├── scad/
│   └── m8_connector_cap.scad    # Parametric M8 x 1.0 threaded protective dust cap
└── stl/
    └── m8_connector_cap.stl     # Compiled 3D mesh for slicing / GitHub 3D preview
```

---

## Parts Included

### M8 × 1.0 Threaded Tool Connector Dust Cap (`m8_connector_cap.scad`)

Protective screw-on dust cap for the **8-pin M8 tool I/O connector** (IEC 61076-2-104) located on the Wrist 3 housing of Universal Robots e-Series arms when no tool cable is attached.

| Parameter | Value / Options | Notes |
| :--- | :--- | :--- |
| **Thread Specification** | **ISO Metric M8 × 1.0 mm** | Standard fine pitch for industrial M8 circular connectors |
| **Connector Gender (`cap_type`)** | **`"female_cap"`** *(default)* / **`"male_plug"`** | Use `"female_cap"` for pre-Sept 2024 male M8 wrist ports; switch to `"male_plug"` for post-Sept 2024 female M8 ports |
| **Outer Diameter** | **Ø 12.0 mm** (knurled) | Ribbed perimeter grip with optional side tether eyelet (`add_tether_loop = true`) |
| **Thread Clearance (`thread_clearance`)** | **0.25 mm** radial offset | Tuned for clean thread engagement off a 0.4 mm FDM nozzle |

#### 3D Printing Recommendations (Bambu Studio / OrcaSlicer)
* **Layer Height:** **0.12 mm** or **0.16 mm** (fine layer height ensures clean **1.0 mm** pitch threads).
* **Material:** **PETG**, **ASA**, or **TPU 95A** (print flat on the closed end face with **zero supports**).
* **Tuning Fit:** If the printed cap feels slightly tight or loose on your specific metal connector, adjust `thread_clearance` in `m8_connector_cap.scad` in `0.05 mm` steps and re-run `./scripts/render_stl.sh`.

