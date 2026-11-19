# Universal Robots Wrist & Control Box Accessories

Parametric **OpenSCAD** models and ready-to-print **STL** files for Universal Robots (`CB-Series` & `e-Series`) wrist accessories, alignment dowel pins, and control box hardware.

---

## Folder Structure

```text
ur-accessories/
├── README.md
├── scad/
│   ├── m8_connector_cap.scad        # Parametric M8 x 1.0 threaded protective dust cap
│   ├── ur_control_box_key.scad      # Rittal double-bit (3 mm / 5 mm) control box cabinet key
│   ├── ur5_alignment_pin_6x12.scad  # Ø 6.0 x 12.0 mm ISO 9409-1-50 flange alignment dowel pin
│   └── ur5_alignment_pin_6x20.scad  # Ø 6.0 x 20.0 mm extended stack alignment dowel pin
└── stl/
    ├── m8_connector_cap.stl
    ├── ur_control_box_key.stl
    ├── ur5_alignment_pin_6x12.stl
    └── ur5_alignment_pin_6x20.stl
```

---

## Parts Included

### 1. M8 × 1.0 Threaded Tool Connector Dust Cap (`m8_connector_cap.scad`)

Protective screw-on dust cap for the **8-pin M8 tool I/O connector** (IEC 61076-2-104) located on the Wrist 3 housing of Universal Robots e-Series arms when no tool cable is attached.

| Parameter | Value / Options | Notes |
| :--- | :--- | :--- |
| **Thread Specification** | **ISO Metric M8 × 1.0 mm** | Standard fine pitch for industrial M8 circular connectors |
| **Connector Gender (`cap_type`)** | **`"female_cap"`** *(default)* / **`"male_plug"`** | Use `"female_cap"` for pre-Sept 2024 male M8 wrist ports; switch to `"male_plug"` for post-Sept 2024 female M8 ports |
| **Outer Diameter** | **Ø 12.0 mm** (knurled) | Ribbed perimeter grip with optional side tether eyelet (`add_tether_loop = true`) |
| **Thread Clearance (`thread_clearance`)** | **0.25 mm** radial offset | Tuned for clean thread engagement off a 0.4 mm FDM nozzle |

#### 3D Printing Recommendations
* **Layer Height:** **0.12 mm** or **0.16 mm** (fine layer height ensures clean **1.0 mm** pitch threads).
* **Material:** **PETG**, **ASA**, or **TPU 95A** (print flat on the closed end face with **zero supports**).

---

### 2. UR Control Box Cabinet Key (`ur_control_box_key.scad`)

Replacement **Rittal double-bit** cabinet key (`SZ 2531.000` style) for opening Universal Robots CB-Series and e-Series control box enclosures.

| Parameter | Value / Options | Notes |
| :--- | :--- | :--- |
| **Key Variant (`key_variant`)** | **`"3mm"`** *(default)* / **`"5mm"`** | `"3mm"` is standard for Universal Robots control boxes; `"5mm"` fits larger Rittal industrial cabinets |
| **Barrel Outer Diameter** | **Ø 9.0 mm** | Fits into standard Ø 10.0 mm cam lock housings |
| **Center Guide Bore** | **Ø 5.3 mm × 14.0 mm deep** | Clears the center alignment pin inside the lock cylinder |
| **Double-Bit Wing Span** | **13.0 mm** tip-to-tip | **2.75 mm** (`"3mm"` variant) or **4.75 mm** (`"5mm"` variant) blade thickness with 0.25 mm print clearance |

#### 3D Printing Recommendations
* **Orientation:** Print **flat on its side** on the build plate (as modeled) so continuous filament loops run along the shaft and resist twisting torque.
* **Strength Settings:** Use **PETG**, **PETG-CF**, or **ASA** with **5 perimeter walls** and **100% infill**.

---

### 3. ISO 9409-1-50 Flange Alignment Dowel Pins (`ur5_alignment_pin_6x12.scad` & `6x20.scad`)

Printable **Ø 6.0 mm** (DIN 7 / ISO 2338 style) alignment dowel pins with **0.8 mm** lead-in end chamfers and a flat side air-relief channel for easy insertion into the UR5 tool flange index hole.

| File | Dimensions | Use Case |
| :--- | :--- | :--- |
| **`ur5_alignment_pin_6x12.scad`** | **Ø 5.95 mm × 12.0 mm** | Standard direct mount between the UR5 tool flange (`6.0 mm` depth) and **Part 1** of the camera mount |
| **`ur5_alignment_pin_6x20.scad`** | **Ø 5.95 mm × 20.0 mm** | Extended stack pin bridging the **Vention ISO 50 Adaptor → Part 1 Housing → Robotiq Coupling** |

#### 3D Printing & Hardware Notes
* **Orientation:** Modeled **horizontally** on the build plate so filament layers run lengthwise along the pin and resist shear forces.
* **Production Upgrade:** For heavy payloads or high-speed robot motion, replace printed pins with hardened stainless steel **DIN 7 / ISO 2338 Ø 6 × 12 mm** or **6 × 20 mm** dowel pins.
