#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd)"

# 1. Render all OpenSCAD (.scad) files -> .stl
find "$REPO_ROOT" -type f -path "*/scad/*.scad" ! -name "*assembly*.scad" | while read -r scad_file; do
    stl_dir="$(dirname "$(dirname "$scad_file")")/stl"
    base_name="$(basename "$scad_file" .scad)"
    stl_file="$stl_dir/$base_name.stl"

    mkdir -p "$stl_dir"
    echo "[SCAD] Rendering: ${scad_file#"$REPO_ROOT"/} -> ${stl_file#"$REPO_ROOT"/}"
    openscad -o "$stl_file" "$scad_file"
done

# 2. Convert all STEP (.step / .STEP) files -> .stl (via Python cadquery)
find "$REPO_ROOT" -type f \( -path "*/step/*.step" -o -path "*/step/*.STEP" \) | while read -r step_file; do
    stl_dir="$(dirname "$(dirname "$step_file")")/stl"
    base_name="$(basename "${step_file%.*}")"
    stl_file="$stl_dir/$base_name.stl"

    mkdir -p "$stl_dir"
    echo "[STEP] Converting: ${step_file#"$REPO_ROOT"/} -> ${stl_file#"$REPO_ROOT"/}"
    python3 -c "import cadquery as cq; s = cq.importers.importStep('$step_file'); cq.exporters.export(s, '$stl_file', tolerance=0.05, angularTolerance=0.1)"
done

echo "All STL files generated!"
