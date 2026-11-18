#!/usr/bin/env bash
set -euo pipefail

# Find all .scad files inside any */scad/ folder (skipping assembly files)
find . -type f -path "*/scad/*.scad" ! -name "*assembly*.scad" | while read -r scad_file; do
    stl_dir="$(dirname "$(dirname "$scad_file")")/stl"
    base_name="$(basename "$scad_file" .scad)"
    stl_file="$stl_dir/$base_name.stl"

    mkdir -p "$stl_dir"
    echo "Rendering: $scad_file -> $stl_file"
    openscad -o "$stl_file" "$scad_file"
done

echo "Done!"
