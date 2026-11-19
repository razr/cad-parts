# CAD Parts

A collection of parametric **OpenSCAD** models, ready-to-print **STL** meshes, and vendor **STEP** files for robotics mounts, grippers, depth sensors, and workshop accessories.

## Repository Structure

```text
cad-parts/
├── README.md
├── scripts/
│   └── render_stl.sh                        # Batch-compiles .scad and .step/.stp files into .stl meshes
├── robotics/
│   ├── ur5-camera-mount/                    # Indexed eye-in-hand camera mount for UR5 (RealSense & Orbbec)
│   ├── vention-iso50-to-iso80-adaptor/      # Vention ISO 50 to ISO 80 tool flange adaptor (MO-GR-015-0080)
│   ├── robotiq-hand-e/                      # Robotiq Hand-E adaptive gripper & UR coupling models
│   └── ur-accessories/                      # Threaded M8 wrist connector dust cap & UR control box key
└── sensors/
    └── orbbec-gemini-335/                   # Orbbec Gemini 335 stereo RGB-D camera STEP & STL models
```

## Generating STL Files

All `.scad` and `.step` / `.stp` files can be batch-converted into `.stl` meshes using the helper script in `scripts/` (requires [OpenSCAD](https://openscad.org) for `.scad` files and Python `cadquery` in `~/.venv-cad` or system Python for `.step` / `.stp` files):

```bash
chmod +x scripts/render_stl.sh

# Render a specific project folder or single file:
./scripts/render_stl.sh sensors/orbbec-gemini-335

# Or render the entire repository:
./scripts/render_stl.sh .
```

The script automatically scans `*/scad/` (skipping `*assembly*.scad` files) and `*/step/` directories, outputting the compiled `.stl` meshes into the corresponding `*/stl/` folder.

## Projects

### Robotics
* **[UR5 Adjustable Camera Mount](robotics/ur5-camera-mount/):** Indexed 22.5°-step wrist mount for Universal Robots (`ISO 9409-1-50-4-M6`), compatible with Intel RealSense D455 and Orbbec Gemini cameras.
* **[Vention ISO 50 to ISO 80 Tool Flange Adaptor](robotics/vention-iso50-to-iso80-adaptor/):** Three-tier robot tool flange adaptor (`P/N: MO-GR-015-0080`) converting between `ISO 9409-1-50-4-M6` and `ISO 9409-1-80-6-M8` tool interfaces.
* **[Robotiq Hand-E Adaptive Gripper](robotics/robotiq-hand-e/):** Vendor STEP models and STL meshes for the Robotiq Hand-E parallel gripper (`50 mm` stroke), symmetrical fingertips, and UR tool flange coupling.
* **[Universal Robots Wrist & Control Box Accessories](robotics/ur-accessories/):** Parametric **M8 × 1.0** threaded protective dust cap for the e-Series wrist tool port and a **3 mm / 5 mm double-bit** Rittal cabinet key for UR control boxes.

### Sensors
* **[Orbbec Gemini 335 Stereo Depth Camera](sensors/orbbec-gemini-335/):** Official vendor STEP model and STL mesh for the Orbbec Gemini 335 active stereo RGB-D camera (`60.5 mm` asymmetric rear M4 mounting pattern).
