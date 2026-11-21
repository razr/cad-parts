# VAP Demonstrator Acrylic Base & Workcell Frame

Vendor **STEP** model, parametric **OpenSCAD** recreation, and **STL** mesh for the **VAP Demonstrator** acrylic base plate (`355.6 mm × 914.4 mm × 9.7 mm`), supporting a linear slider channel for two connector carriers and two mating stations.

---

## Folder Structure

```text
vap-demonstrator/
├── README.md
├── step/
│   └── vap_acrylicbase_plate.stp    # Original SIEMENS NX vendor STEP file
├── scad/
│   └── vap_acrylic_base_plate.scad  # Centered parametric OpenSCAD recreation
└── stl/
    └── vap_acrylicbase_plate.stl    # Compiled 3D mesh for GitHub preview / assembly
```

---

## Mechanical Specifications

| Feature | Specification | Notes |
| :--- | :--- | :--- |
| **Plate Dimensions** | **355.6 mm × 914.4 mm × 9.7 mm** (`14" × 36"`) | Machined cast acrylic sheet with **R 50.8 mm** (`2.0"`) rounded corners and **0.5 mm** bottom perimeter chamfer |
| **Linear Slider Channel Mounts** | **12 × Ø 4.4 mm** through-holes (M4) | 6 pairs spaced **25.52 mm** apart along the left channel rail (`Y = -292.7` to `+122.3 mm`) |
| **Connector / Mating Stations** | **2 × 4-hole** patterns (**30.0 mm × 80.82 mm**) | **Ø 4.4 mm** through-holes (M4); upper station oriented vertically, lower station rotated **90°** horizontally |

---

## Related Parts in This Repository

* **[VAP Calibration Blocks (`robotics/ur-accessories/`)](../../robotics/ur-accessories/):** Slider grip calibration block and calibration sphere pedestal designed to ride along the demonstrator channel.
