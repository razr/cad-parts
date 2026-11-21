# VAP Demonstrator Workcell & Calibration Fixtures

Parametric **OpenSCAD** models, vendor **STEP** files, and ready-to-print **STL** meshes for the **VAP Demonstrator** workcell (`355.6 mm × 914.4 mm × 12.7 mm` acrylic base plate) and its channel-mounted **calibration blocks**.

---

## Folder Structure

```text
vap-demonstrator/
├── README.md
├── scad/
│   ├── vap_acrylic_base_plate.scad            # Centered 14" x 36" x 0.5" acrylic base plate
│   ├── vap_calibration_sphere_block.scad      # 50 x 50 x 65 mm base with Ø 15 mm datum sphere
│   └── vap_calibration_slider_grip_block.scad # Contoured parallel-jaw gripper & channel slider block
├── step/
│   ├── vap_acrylic_base_plate.stp
│   ├── vap_calibration_sphere_block.step
│   └── vap_calibration_slider_grip_block.step
└── stl/
    ├── vap_acrylic_base_plate.stl
    ├── vap_calibration_sphere_block.stl
    └── vap_calibration_slider_grip_block.stl
```

---

## Parts Included

### 1. Acrylic Base Plate (`vap_acrylic_base_plate`)
* **Dimensions:** **355.6 mm × 914.4 mm × 12.7 mm** (`14.0" × 36.0" × 0.50"`) with **R 50.8 mm** (`2.0"`) rounded corners and a **0.5 mm** bottom perimeter chamfer.
* **Mounting Patterns (20 × Counterbored M4 Holes — `Ø 4.40 mm` through / `Ø 8.50 mm` counterbore):**
  * **12 Channel Holes:** 6 pairs spaced **25.52 mm** apart (`Y = -292.67` to `+122.33 mm`) for mounting the linear slider channel.
  * **8 Station Holes:** Two **30.0 mm × 80.82 mm** 4-hole patterns (upper station vertical, lower station rotated **90°** horizontally) for mounting the two mating connector stations.

### 2. VAP Calibration Sphere Block (`vap_calibration_sphere_block`)
* **Dimensions:** **50.0 mm × 50.0 mm × 65.0 mm** overall (`25.0 mm` hollow base with **5.0 mm** walls and central stiffener rib + **Ø 10.0 mm** stick with **4.0 mm** base fillet + **Ø 15.0 mm** reference calibration sphere).
* **Mounting:** **2 × Ø 8.0 mm** top-deck holes spaced at `X = ±14.25 mm` (`28.5 mm` pitch) to bolt onto the slider grip block.

### 3. VAP Calibration Slider Grip Block (`vap_calibration_slider_grip_block`)
* **Dimensions:** **32.0 mm × 71.14 mm × 25.0 mm** contoured parallel-jaw gripper target with end channel-slider tabs (`±Y`), side gripper-grab pads (`-X`), central **Ø 10.0 mm** bore, and **2 × Ø 8.0 mm** alignment holes (`Y = ±15.51 mm`).

