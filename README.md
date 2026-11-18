# CAD Parts

A collection of parametric **OpenSCAD** models and ready-to-print **STL** files for robotics mounts, camera brackets, and custom hardware fixtures.

## Repository Structure

```text
cad-parts/
├── README.md
├── scripts/
│   └── render_stl.sh          # Batch-compiles all .scad files into .stl meshes
└── robotics/
    └── ur5-camera-mount/      # Indexed eye-in-hand camera mount for UR5 (RealSense & Orbbec)
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

