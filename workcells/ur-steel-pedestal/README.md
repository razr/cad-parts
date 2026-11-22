# JUGARD+KÜNSTNER Steel Robot Pedestal (`Robotergestell_Stahl`)

Parametric **OpenSCAD** models and ready-to-print/assembly **STL** meshes for the **JUGARD+KÜNSTNER** heavy-duty welded steel robot pedestal (**Drawing No. `16342-0-00-00-0`**) fitted with **4 × Xigner / GD-60F** heavy-duty leveling casters (`1000 kg` total load capacity) for **Universal Robots UR20 / UR30** arms.

---

## Folder Structure

```text
ur-steel-pedestal/
├── README.md
├── docs/
│   └── 16342-0-00-00-0_ROBOTERGESTELL_STAHL_EX.pdf  # Manufacturer reference drawing
├── scad/
│   ├── ur_steel_pedestal_table.scad                # Complete pedestal assembly (780 x 780 x 815 mm)
│   └── gd60f_leveling_caster.scad                  # Parametric Xigner / GD-60F 250 kg leveling caster
└── stl/
    ├── ur_steel_pedestal_table.stl
    └── gd60f_leveling_caster.stl
```

---

## Mechanical Specifications

| Feature | Specification | Notes |
| :--- | :--- | :--- |
| **Overall Footprint** | **780.0 mm × 780.0 mm** | **10.0 mm** laser-cut steel top deck (`Stahlplatte 10 mm mit Bohrbild`) |
| **Total Height** | **815.0 mm** (rolling) / **815–825 mm** (leveled) | **733.0 mm** welded **60 × 60 mm** square-tube steel frame + **82.0 mm** leveling casters |
| **UR20 / UR30 Base Pattern** | **6 × M10 tapped holes** + **2 × Ø 8.0 mm dowel holes** | Arranged on a **Ø 218.0 mm** pitch circle (`60°` spacing, for **M10 × 35 mm** bolts) with a **Ø 45.0 mm** center cable pass-through bore |
| **Internal Ballast** | **25 kg** welded steel bottom pan + **16 × ~12 kg** plates | Removable stacked steel counterweight plates (`~217 kg` total ballast) |
| **Side Enclosures** | **4 × removable** sheet-metal side panels | `Seitenverkleidung abnehmbar` (`show_side_panels` & `explode_panels` toggles in OpenSCAD) |
| **Leveling Casters** | **4 × Xigner / GD-60F** (`250 kg` each / `1000 kg` set) | **73 × 73 mm** mounting plate (**58 × 58 mm** 4-bolt pattern), **Ø 50 × 25 mm** nylon wheel, retractable NBR rubber pad |

---

## Quick Build

Generate updated `.stl` meshes from the `.scad` sources:

```bash
./scripts/render_stl.sh workcells/ur-steel-pedestal
```
