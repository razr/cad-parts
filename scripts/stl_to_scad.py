#!/usr/bin/env python3
import argparse
import os
from pathlib import Path
import trimesh


def write_wrapper_scad(stl_path: Path, scad_path: Path):
    rel_stl = os.path.relpath(stl_path, scad_path.parent)
    module_name = stl_path.stem.replace("-", "_").replace(" ", "_")
    content = f"""// Auto-generated OpenSCAD wrapper for {stl_path.name}
// Units: millimeters (mm)

module {module_name}() {{
    import("{rel_stl}", convexity = 10);
}}

{module_name}();
"""
    scad_path.write_text(content, encoding="utf-8")


def write_polyhedron_scad(stl_path: Path, scad_path: Path):
    mesh = trimesh.load(stl_path, force="mesh")
    module_name = stl_path.stem.replace("-", "_").replace(" ", "_")

    verts = ",\n        ".join(f"[{v[0]:.6f}, {v[1]:.6f}, {v[2]:.6f}]" for v in mesh.vertices)
    faces = ",\n        ".join(f"[{f[0]}, {f[1]}, {f[2]}]" for f in mesh.faces)

    content = f"""// Auto-generated self-contained OpenSCAD polyhedron from {stl_path.name}
// Vertices: {len(mesh.vertices)} | Faces: {len(mesh.faces)}

module {module_name}() {{
    polyhedron(
        points = [
        {verts}
        ],
        faces = [
        {faces}
        ],
        convexity = 10
    );
}}

{module_name}();
"""
    scad_path.write_text(content, encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Convert STL files into OpenSCAD (.scad) files.")
    parser.add_argument("target", nargs="?", default=".", help="Target STL file or directory")
    parser.add_argument(
        "--mode",
        choices=["wrapper", "polyhedron"],
        default="wrapper",
        help="'wrapper' creates import() .scad (clean); 'polyhedron' embeds raw mesh coordinates",
    )
    args = parser.parse_args()

    target = Path(args.target).resolve()
    stl_files = [target] if target.is_file() else sorted(target.rglob("stl/*.stl"))

    for stl_file in stl_files:
        scad_dir = stl_file.parent.parent / "scad"
        scad_dir.mkdir(parents=True, exist_ok=True)
        scad_file = scad_dir / f"{stl_file.stem}.scad"

        print(f"[STL -> SCAD ({args.mode})] {stl_file} -> {scad_file}")
        if args.mode == "wrapper":
            write_wrapper_scad(stl_file, scad_file)
        else:
            write_polyhedron_scad(stl_file, scad_file)


if __name__ == "__main__":
    main()
