# CAD Conversion & Rendering Scripts

Helper utilities for batch-compiling parametric **OpenSCAD** (`.scad`) models and vendor **STEP** (`.step` / `.stp`) files into ready-to-print **STL** meshes.

---

## Prerequisites & One-Time Setup

Run these commands once on a new machine or user account (Ubuntu / Debian):

### 1. Install OpenSCAD (for `.scad` files)
```bash
sudo apt update && sudo apt install -y openscad
```

### 2. Install CadQuery in a Virtual Environment (for `.step` / `.stp` files)
```bash
python3 -m venv ~/.venv-cad
~/.venv-cad/bin/pip install cadquery
```

---

## Usage (`render_stl.sh`)

Make the script executable once:
```bash
chmod +x scripts/render_stl.sh
```

### Run Directly (Auto-Detects `~/.venv-cad`)
`render_stl.sh` automatically checks for `$HOME/.venv-cad/bin/python3`, so you can run it directly without activating the environment:

```bash
# From the repository root:
./scripts/render_stl.sh sensors/orbbec-gemini-335Lg
./scripts/render_stl.sh robotics/ur-accessories/scad/m8_connector_cap.scad

# From inside a project folder:
../../scripts/render_stl.sh

# Render the entire repository:
./scripts/render_stl.sh .
```

### Run with Manual Environment Activation
If you prefer activating the virtual environment manually (or use a custom venv path):

```bash
source ~/.venv-cad/bin/activate
./scripts/render_stl.sh
deactivate
```

### How It Works
* **OpenSCAD (`*/scad/*.scad`):** Compiles every `.scad` file (skipping `*assembly*.scad` files) into `../stl/<name>.stl`.
* **STEP (`*/step/*.step` & `*.stp`):** Tessellates B-Rep STEP models into `../stl/<name>.stl` (`tolerance=0.1`, `angularTolerance=0.2`) for fast slicing and GitHub 3D previewing.

