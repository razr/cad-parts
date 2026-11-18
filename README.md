# CAD Parts

A collection of parametric **OpenSCAD** models, ready-to-print **STL** meshes, and reference CAD files for robotics mounts, camera brackets, and custom hardware fixtures.

## Repository Structure

```text
cad-parts/
├── README.md
├── scripts/
│   └── render_stl.sh                    # Batch-compiles all .scad files into .stl meshes
└── robotics/
    ├── ur5-camera-mount/                # Indexed eye-in-hand camera mount for UR5 (RealSense & Orbbec)
    └── vention-iso50-to-iso80-adaptor/  # Vention ISO 50 to ISO 80 tool flange adaptor (MO-GR-015-0080)
```

## Generating STL Files

All individual part `.scad` files can be batch-converted into `.stl` files using the helper script in `scripts/` (requires [OpenSCAD](https://openscad.org) installed locally):

```bash
chmod +x scripts/render_stl.sh
./scripts/render_stl.sh
```

The script automatically scans every `*/scad/` folder (skipping `*assembly*.scad` files) and writes the compiled meshes into the corresponding `*/stl/` directory.

## Projects

* **[UR5 Adjustable Camera Mount](robotics/ur5-camera-mount/):** Indexed 22.5°-step wrist mount for Universal Robots UR5 (`ISO 9409-1-50-4-M6`), compatible with Intel RealSense D455 and Orbbec Gemini cameras.
* **[Vention ISO 50 to ISO 80 Tool Flange Adaptor](robotics/vention-iso50-to-iso80-adaptor/):** Three-tier robot tool flange adaptor (`P/N: MO-GR-015-0080`) converting an `ISO 9409-1-50-4-M6` robot wrist to an `ISO 9409-1-80-6-M8` tool interface.
