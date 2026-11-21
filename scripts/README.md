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
sudo apt install python3.14-venv
python3 -m venv ~/.venv-cad
source ~/.venv-cad/bin/activate
~/.venv-cad/bin/pip install cadquery
```

---

## Usage (`render_stl.sh`)

Make the script executable once:
```bash
chmod +x scripts/render_stl.sh
```

### Generate Only New / Missing STL Files (Default)
By default, `render_stl.sh` skips any `.stl` file that already exists and only compiles missing files. It automatically detects `$HOME/.venv-cad/bin/python3`, so no manual environment activation is required:

```bash
# From the repository root (renders only missing .stl files):
./scripts/render_stl.sh .
./scripts/render_stl.sh robotics/ur5-camera-mount

# From inside a project folder:
../../scripts/render_stl.sh
```

### Force Re-Rendering Existing STL Files (`-f` / `--force`)
Pass `-f` (or `--force`) before or after the target path to overwrite and regenerate existing `.stl` files:

```bash
./scripts/render_stl.sh -f
./scripts/render_stl.sh -f robotics/ur5-camera-mount
./scripts/render_stl.sh robotics/ur-accessories/scad/m8_connector_cap.scad -f
```

### Run with Manual Environment Activation
If you prefer activating the virtual environment manually (or use a custom venv path):

```bash
source ~/.venv-cad/bin/activate
./scripts/render_stl.sh
deactivate
```

### How It Works
* **OpenSCAD (`*/scad/*.scad`):** Compiles every `.scad` file into `../stl/<name>.stl`.
* **STEP (`*/step/*.step` & `*.stp`):** Tessellates B-Rep STEP models into `../stl/<name>.stl` (`tolerance=0.1`, `angularTolerance=0.2`) for fast slicing and GitHub 3D previewing.

