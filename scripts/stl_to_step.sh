#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd)"
TARGET="${1:-.}"
TARGET_PATH="$(realpath "$TARGET")"

if ! command -v freecadcmd >/dev/null 2>&1; then
    echo "Error: 'freecadcmd' is not installed (install with: sudo apt install -y freecad)"
    exit 1
fi

find "$TARGET_PATH" -type f -path "*/stl/*.stl" | while read -r stl_file; do
    step_dir="$(dirname "$(dirname "$stl_file")")/step"
    base_name="$(basename "$stl_file" .stl)"
    step_file="$step_dir/$base_name.step"

    mkdir -p "$step_dir"
    echo "[STL -> STEP] Converting: ${stl_file#"$REPO_ROOT"/} -> ${step_file#"$REPO_ROOT"/}"

    freecadcmd -c "
import Mesh, Part
mesh = Mesh.Mesh('$stl_file')
shape = Part.Shape()
shape.makeShapeFromMesh(mesh.Topology, 0.1)
shape = shape.removeSplitter()
solid = Part.makeSolid(shape)
solid.exportStep('$step_file')
" >/dev/null
done

echo "Done!"
