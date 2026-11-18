# Vention ISO 50 to ISO 80 Tool Flange Adaptor (`MO-GR-015-0080`)

Parametric **OpenSCAD** reproduction, ready-to-print **STL** mesh, and reference CAD/blueprint files for the **Vention ISO 9409-1-50-4-M6 to ISO 9409-1-80-6-M8** robot tool flange adaptor (**P/N: MO-GR-015-0080**, Rev 1.0).

This three-tier adaptor converts a smaller **ISO 50** robot wrist interface (such as a Universal Robots UR3e/UR5e/UR5) to accept larger **ISO 80** end-of-arm tooling and grippers.

---

## Folder Structure

```text
vention-iso50-to-iso80-adaptor/
├── README.md
├── scad/
│   └── MO-GR-015-0080.scad    # Parametric OpenSCAD model
├── stl/
│   └── MO-GR-015-0080.stl     # Compiled 3D mesh for slicing / GitHub 3D preview
├── step/
│   └── MO-GR-015-0080.STEP    # Original Vention B-Rep STEP model
└── docs/
    └── MO-GR-015-0080.pdf     # Official Vention technical blueprint
```

---

## Dimension Specifications (Units: mm)

| Section | Feature | Dimension | Notes & Orientation |
| :--- | :--- | :--- | :--- |
| **Three-Tier Axial Body** | **Overall Height** | **22.00 mm** | Combined stack height across all three cylindrical tiers |
| | **Bottom Male Pilot (ISO 50 Side)** | **Ø 50.00 h7 × 6.00 mm tall** | Seats into the ISO 50 robot tool flange pilot recess (`Z = 0` to `6.00 mm`) |
| | **Middle Main Flange Disc** | **Ø 100.0 mm × 10.00 mm thick** | Main structural flange body (`Z = 6.00` to `16.00 mm`) |
| | **Top Male Pilot (ISO 80 Tool Side)** | **Ø 63.00 h8 × 6.00 mm tall** | Protruding male pilot boss for ISO 80 tools (`Z = 16.00` to `22.00 mm`) |
| | **Central Through-Bore** | **Ø 31.50 H7** | Full-depth central pilot bore through all **22.00 mm** |
| | **Outer Edge Chamfers** | **0.50 mm × 45°** | Applied to outer perimeter edges |
| **ISO 50 Robot Interface (Inner BCD)** | **Bolt Circle Diameter (BCD)** | **Ø 50.00 mm** | Matches ISO 9409-1-50-4-M6 pattern |
| | **Mounting Holes** | **4 × Ø 6.25 mm thru-all** | Positioned at **45°, 135°, 225°, and 315°** (tapped for **M6 × 1.0** Helicoil inserts in CNC version) |
| | **Alignment Pin Hole** | **1 × Ø 6.00 H7 × 6.20 mm deep** | Blind dowel hole from bottom face (`Z = 0` to `6.20 mm`) at **90° (`+Y`)** |
| **ISO 80 Tool Interface (Outer BCD)** | **Bolt Circle Diameter (BCD)** | **Ø 80.00 mm** | Matches ISO 9409-1-80-6-M8 pattern |
| | **Mounting Holes** | **6 × Ø 9.00 mm thru-all** | Positioned every **60°** (**0°, 60°, 120°, 180°, 240°, 300°**) for **M8** bolts |
| | **Mounting Counterbores** | **6 × Ø 15.00 mm × 6.00 mm deep** | Recessed from top shoulder (`Z = 10.00` to `16.00 mm`) to seat M8 socket head cap screws flush |
| | **Alignment Pin Hole** | **1 × Ø 8.00 H7 × 8.00 mm deep** | Blind dowel hole from bottom flange face (`Z = 6.00` to `14.00 mm`) at **90° (`+Y`)** |

---

## Hardware & 3D Printing Notes

* **CNC Manufacturing (Production):** Machine from **6061-T6 aluminum** and install **4 × M6 × 1.0 Helicoil** thread inserts into the Ø 6.25 mm inner holes.
* **3D Printing (Prototyping / Light Tooling):**
  * **Material:** Print in **PETG-CF**, **PA-CF**, or **PETG** with **5 wall loops** and **50% gyroid infill**.
  * **Orientation:** Place the **Ø 50.0 mm** bottom pilot boss flat on the build plate and enable **Tree supports** under the **Ø 100.0 mm** flange overhang (`Z = 6.00 mm`).
  * **Fasteners (Printed Version):** Since plastic cannot be tapped with Helicoils directly, use **M6 × 25 mm** bolts with **M6 nuts** or drill out the 4 inner holes to **Ø 8.0 mm** for **M6 brass heat-set inserts**.
