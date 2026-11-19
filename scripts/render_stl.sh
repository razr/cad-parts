#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd)"
FORCE=false
TARGET="."

# Parse optional -f / --force flag and target path
while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--force)
            FORCE=true
            shift
            ;;
        *)
            TARGET="$1"
            shift
            ;;
    esac
done

TARGET_PATH="$(realpath "$TARGET")"

# Auto-select ~/.venv-cad Python if available, otherwise fall back to system python3
PYTHON_BIN="python3"
if [ -x "$HOME/.venv-cad/bin/python3" ]; then
    PYTHON_BIN="$HOME/.venv-cad/bin/python3"
fi

# 1. Render ALL OpenSCAD (.scad) files -> .stl
if command -v openscad >/dev/null 2>&1; then
    find "$TARGET_PATH" -type f -path "*/scad/*.scad" | while read -r scad_file; do
        stl_dir="$(dirname "$(dirname "$scad_file")")/stl"
        base_name="$(basename "$scad_file" .scad)"
        stl_file="$stl_dir/$base_name.stl"

        if [ "$FORCE" = false ] && [ -f "$stl_file" ]; then
            echo "[SCAD] Skipping existing: ${stl_file#"$REPO_ROOT"/}"
            continue
        fi

        mkdir -p "$stl_dir"
        echo "[SCAD] Rendering: ${scad_file#"$REPO_ROOT"/} -> ${stl_file#"$REPO_ROOT"/}"
        openscad -o "$stl_file" "$scad_file"
    done
else
    echo "[SKIP] 'openscad' is not installed"
fi

# 2. Convert ALL STEP (.step / .STEP / .stp / .STP) files -> .stl (via Python cadquery)
if "$PYTHON_BIN" -c "import cadquery" >/dev/null 2>&1; then
    find "$TARGET_PATH" -type f \( -path "*/step/*.step" -o -path "*/step/*.STEP" -o -path "*/step/*.stp" -o -path "*/step/*.STP" \) | while read -r step_file; do
        stl_dir="$(dirname "$(dirname "$step_file")")/stl"
        base_name="$(basename "${step_file%.*}")"
        stl_file="$stl_dir/$base_name.stl"

        if [ "$FORCE" = false ] && [ -f "$stl_file" ]; then
            echo "[STEP] Skipping existing: ${stl_file#"$REPO_ROOT"/}"
            continue
        fi

        mkdir -p "$stl_dir"
        echo "[STEP] Converting: ${step_file#"$REPO_ROOT"/} -> ${stl_file#"$REPO_ROOT"/}"
        "$PYTHON_BIN" -c "import cadquery as cq; s = cq.importers.importStep('$step_file'); cq.exporters.export(s, '$stl_file', tolerance=0.1, angularTolerance=0.2)"
    done
else
    echo "[SKIP] Python 'cadquery' not installed in $PYTHON_BIN"
fi

echo "Done!"

