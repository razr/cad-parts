# Universal Robots Wrist & Control Box Accessories

Parametric **OpenSCAD** models and ready-to-print **STL** files for Universal Robots (`CB-Series`, `e-Series`, and `UR20`) wrist hardware and control box enclosures.

---

## Folder Structure

```text
ur-accessories/
├── README.md
├── scad/
│   ├── m8_connector_cap.scad     # Parametric M8 x 1.0 threaded protective dust cap
│   └── ur_control_box_key.scad   # Rittal double-bit (3 mm / 5 mm) control box cabinet key
└── stl/
    ├── m8_connector_cap.stl
    └── ur_control_box_key.stl
```

---

## Parts Included

### 1. M8 × 1.0 Threaded Tool Connector Dust Cap (`m8_connector_cap.scad`)

Protective screw-on dust cap for the **8-pin M8 tool I/O connector** (IEC 61076-2-104) located on the Wrist 3 housing of Universal Robots e-Series arms when no tool cable is attached.

| Parameter | Value / Options | Notes |
| :--- | :--- | :--- |
| **Thread Specification** | **ISO Metric M8 × 1.0 mm** | Standard fine pitch for industrial M8 circular connectors |
| **Connector Gender (`cap_type`)** | **`"female_cap"`** *(default)* / **`"male_plug"`** | `"female_cap"` for pre-Sept 2024 male M8 wrist ports; `"male_plug"` for post-Sept 2024 female M8 ports |
| **Outer Diameter** | **Ø 12.0 mm** (knurled) | Ribbed perimeter grip with optional side tether eyelet (`add_tether_loop = true`) |
| **Thread Clearance (`thread_clearance`)** | **0.25 mm** radial offset | Tuned for clean thread engagement off a 0.4 mm FDM nozzle (`0.12–0.16 mm` layer height) |

---

### 2. UR Control Box Cabinet Key (`ur_control_box_key.scad`)

Replacement **Rittal double-bit** cabinet key (`SZ 2531.000` style) for Universal Robots control box enclosures.

| Parameter | Value / Options | Notes |
| :--- | :--- | :--- |
| **Key Variant (`key_variant`)** | **`"3mm"`** *(default)* / **`"5mm"`** | `"3mm"` fits standard UR control boxes; `"5mm"` fits larger Rittal cabinets |
| **Barrel / Guide Bore** | **Ø 9.0 mm** OD / **Ø 5.3 mm** ID | Clears the center alignment pin inside the lock cylinder |
| **Double-Bit Wing Span** | **13.0 mm** tip-to-tip | **2.75 mm** (`"3mm"`) or **4.75 mm** (`"5mm"`) blade thickness; print flat on build plate with 100% infill |

