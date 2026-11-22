# CAD Parts

A collection of parametric **OpenSCAD** models, ready-to-print **STL** meshes, and vendor **STEP** files for robotics mounts, grippers, depth sensors, workshop accessories, and workcell demonstrators.

## Repository Structure

```text
cad-parts/
├── README.md
├── scripts/
│   ├── render_stl.sh                        # Batch-compiles .scad and .step/.stp files into .stl meshes
│   ├── stl_to_scad.py                       # Generates OpenSCAD wrappers or polyhedrons from .stl files
│   └── stl_to_step.sh                       # Converts watertight .stl meshes into .step solids via FreeCAD
├── robotics/
│   ├── ur5-camera-mount/                    # Indexed eye-in-hand camera mount for UR5 (RealSense & Orbbec)
│   ├── vention-iso50-to-iso80-adaptor/      # Vention ISO 50 to ISO 80 tool flange adaptor (MO-GR-015-0080)
│   ├── robotiq-hand-e/                      # Robotiq Hand-E adaptive gripper & UR coupling models
│   └── ur-accessories/                      # Threaded M8 wrist connector dust cap & UR control box key
├── sensors/
│   └── orbbec-gemini-335/                   # Orbbec Gemini 335 stereo RGB-D camera STEP & STL models
└── workcells/
    └── vap-demonstrator/                    # VAP demonstrator acrylic base plate & calibration blocks
```

## Helper Scripts

* **Compile `.scad` & `.step` → `.stl`:** `./scripts/render_stl.sh <target-folder>`
* **Convert `.stl` → `.scad`:** `~/.venv-cad/bin/python3 scripts/stl_to_scad.py <target-folder> --mode wrapper`
* **Convert `.stl` → `.step`:** `./scripts/stl_to_step.sh <target-folder>`

## Projects

### Robotics
* **[UR5 Adjustable Camera Mount](robotics/ur5-camera-mount/):** Indexed 22.5°-step wrist mount for Universal Robots (`ISO 9409-1-50-4-M6`), compatible with Intel RealSense D455 and Orbbec Gemini cameras.
* **[Vention ISO 50 to ISO 80 Tool Flange Adaptor](robotics/vention-iso50-to-iso80-adaptor/):** Three-tier robot tool flange adaptor (`P/N: MO-GR-015-0080`) converting between `ISO 9409-1-50-4-M6` and `ISO 9409-1-80-6-M8` tool interfaces.
* **[Robotiq Hand-E Adaptive Gripper](robotics/robotiq-hand-e/):** Vendor STEP models and STL meshes for the Robotiq Hand-E parallel gripper (`50 mm` stroke), symmetrical fingertips, and UR tool flange coupling.
* **[Universal Robots Accessories](robotics/ur-accessories/):** Threaded **M8 × 1.0** wrist connector dust cap and **3 mm / 5 mm double-bit** Rittal cabinet key for UR control boxes.

### Sensors
* **[Orbbec Gemini 335 Stereo Depth Camera](sensors/orbbec-gemini-335/):** Official vendor STEP model and STL mesh for the Orbbec Gemini 335 active stereo RGB-D camera (`60.5 mm` asymmetric rear M4 mounting pattern).

### Workcells
* **[VAP Demonstrator Workcell](workcells/vap-demonstrator/):** Machined `14" × 36" × 0.5"` (`355.6 mm × 914.4 mm × 12.7 mm`) acrylic base plate with counterbored M4 mounting patterns, plus the VAP calibration sphere pedestal and slider grip block.

