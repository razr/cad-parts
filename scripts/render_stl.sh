#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd)"

# 1. Render OpenSCAD (.scad) files -> .stl
if command -v openscad >/dev/null 2>&1; then
    find "$REPO_ROOT" -type f -path "*/scad/*.scad" ! -name "*assembly*.scad" | while read -r scad_file; do
        stl_dir="$(dirname "$(dirname "$scad_file")")/stl"
        base_name="$(basename "$scad_file" .scad)"
        stl_file="$stl_dir/$base_name.stl"

        mkdir -p "$stl_dir"
        if [ ! -f "$stl_file" ] || [ "$scad_file" -nt "$stl_file" ]; then
            echo "[SCAD] Rendering: ${scad_file#"$REPO_ROOT"/} -> ${stl_file#"$REPO_ROOT"/}"
            openscad -o "$stl_file" "$scad_file"
        else
            echo "[SCAD] Up to date: ${stl_file#"$REPO_ROOT"/}"
        fi
    done
else
    echo "[SKIP] 'openscad' is not installed (install with: sudo apt install -y openscad)"
fi

# 2. Convert STEP (.step / .STEP) files -> .stl (via Python cadquery)
if python3 -c "import cadquery" >/dev/null 2>&1; then
    find "$REPO_ROOT" -type f \( -path "*/step/*.step" -o -path "*/step/*.STEP" \) | while read -r step_file; do
        stl_dir="$(dirname "$(dirname "$step_file")")/stl"
        base_name="$(basename "${step_file%.*}")"
        stl_file="$stl_dir/$base_name.stl"

        mkdir -p "$stl_dir"
        if [ ! -f "$stl_file" ] || [ "$step_file" -nt "$stl_file" ]; then
            echo "[STEP] Converting: ${step_file#"$REPO_ROOT"/} -> ${stl_file#"$REPO_ROOT"/}"
            python3 -c "import cadquery as cq; s = cq.importers.importStep('$step_file'); cq.exporters.export(s, '$stl_file', tolerance=0.1, angularTolerance=0.2)"
        else
            echo "[STEP] Up to date: ${stl_file#"$REPO_ROOT"/}"
        fi
    done
else
    echo "[SKIP] Python 'cadquery' not installed (install with: pip install cadquery)"
fi

echo "Done!"
