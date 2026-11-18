# UR5 Adjustable Eye-in-Hand Camera Mount (RealSense & Orbbec)

Parametric **OpenSCAD** models and ready-to-print **STL** files for an indexed, adjustable wrist camera mount compatible with **Universal Robots UR5** (**ISO 9409-1-50-4-M6** tool flange).

The linkage uses **Ø 10.0 mm** slip-fit alignment bosses and **Ø 2.0 mm** dowel pins engaging a 9-hole semicircular indexing pattern (**0° to 180°** in **22.5°** steps), keeping the camera bracket rigidly locked without slipping under robot acceleration.

---

## Folder Structure

```text
ur5-camera-mount/
├── README.md
├── scad/
│   ├── part1_ur5_flange_housing.scad
│   ├── part2_male_connecting_link.scad
│   ├── part3_female_connecting_link.scad
│   ├── part4_camera_bracket.scad
│   └── assembly.scad
└── stl/
    ├── part1_ur5_flange_housing.stl
    ├── part2_male_connecting_link.stl
    ├── part3_female_connecting_link.stl
    └── part4_camera_bracket.stl
```

---

## Bill of Materials (Hardware & Fasteners)

| Qty | Component | Specification / DIN Standard | Purpose |
| :--- | :--- | :--- | :--- |
| **4** | **M6 × 25 mm** Socket Head Cap Screws | DIN 912 / ISO 4762 (with **4 × M6** DIN 125 washers) | Mounts Part 1 onto the UR5 ISO 9409-1 tool flange |
| **1** | **Ø 6.0 × 12 mm** Cylinder Dowel Pin | DIN 7 / ISO 2338 | Aligns Part 1 with the UR5 flange index hole |
| **2** | **M5 × 25 mm** Socket Head Cap Screws | DIN 912 / ISO 4762 | Clamps the two pivot joints (head sits flush in Part 2 counterbore) |
| **2** | **M5** Self-Locking Nyloc Nuts | DIN 985 / ISO 10511 | Secures the M5 pivot bolts on the back of Part 3 |
| **2** | **M5** Flat Washers | DIN 125 / ISO 7089 | Distributes nut clamping load against Part 3 |
| **2** | **Ø 2.0 × 5.0 mm** Cylinder Dowel Pins | DIN 7 / ISO 2338 (or 2.0 mm HSS drill shank) | Press-fits into Part 2 (3.0 mm deep) to engage the 22.5° indexing holes |
| **2** | **M4 × 12 mm** Socket Head Cap Screws | DIN 912 / ISO 4762 (with **2 × M4** DIN 125 washers) | Mounts Intel RealSense D455 or Orbbec Gemini camera to Part 4 |

---

## 3D Printing & Manufacturing Guidelines

Originally designed for **CNC 6061-T6 aluminum**, this assembly can be 3D printed for prototyping or light-duty vision tasks (**200 g – 400 g** cameras).

### Recommended Filaments
* **Best (High Stiffness):** **PETG-CF** or **PA-CF** (Carbon-Fiber Reinforced) — minimizes vibration and micro-flex during robot motion.
* **Good (Standard Engineering):** **PETG**, **ASA**, or **ABS** — strong layer adhesion and resistance to bolt clamping pressure.
* **Avoid:** **Standard PLA** — prone to bolt creep under continuous screw tension and softening near warm robot wrist joints.

### Slicer Settings (Bambu Studio / OrcaSlicer)
* **Nozzle:** 0.4 mm | **Layer Height:** 0.20 mm
* **Wall Loops:** **4 – 5 perimeters** | **Infill:** **40% – 60% Gyroid or Cubic**
* **Print Orientation & Supports:**
  * **Part 1:** Flat on bottom flange face (**Tree supports** enabled for the 6.0 mm bottom skirt and tongue transition).
  * **Part 2:** Flat on counterbored back face with male bosses pointing **up** (no supports needed).
  * **Part 3:** Flat on back face with female pockets pointing **up** (no supports needed).
  * **Part 4:** Place on its side edge (`Y` face down) with **Tree supports** so continuous perimeter loops reinforce the 90° T-junction.
* **Post-Processing:** Chase the **Ø 2.0 mm** indexing holes and **Ø 5.5 mm** bores with drill bits after printing to clear seam bulge.

---

## Part Dimension Specifications (Units: mm)

### Part 1: UR5 Flange Extension Housing

| Section | Feature | Dimension | Notes & Orientation |
| :--- | :--- | :--- | :--- |
| **Main Cylindrical Body** | **Outer Diameter** | **Ø 69.0 mm** | Main outer collar diameter |
| | **Main Collar Height** | **22.0 mm** | Height of the Ø 69.0 mm collar (from bottom face to top shoulder) |
| | **Bottom Female Skirt** | **Ø 63.5 mm × 6.0 mm deep** | Recessed inside the bottom of the 22.0 mm collar |
| | **Top Male Flange Boss** | **Ø 63.0 mm × 8.0 mm tall** | Sits on top of the 22.0 mm main collar |
| | **Overall Total Height** | **30.0 mm** | Combined axial height (**22.0 mm** main collar + **8.0 mm** top male boss) |
| | **Central Through-Bore** | **Ø 31.5 mm** | Standard UR5 pilot bore through the entire 30.0 mm height |
| **Flange Bolt Pattern (UR5 ISO 9409-1)** | **Bolt Circle Diameter (BCD)** | **Ø 50.0 mm** | 8 holes total, spaced every **45°** |
| | **Alignment Pin Holes** | **4 × Ø 6.0 mm** | Positioned at **0°, 90°, 180°, and 270°** (**0° hole aligned directly with Radial Base Lug & Vertical Tongue**) |
| | **Mounting Clearance Holes** | **4 × Ø 7.0 mm** | Positioned at **45°, 135°, 225°, and 315°** (matches the 4 × M6 threaded holes on the UR5 flange) |
| **Radial Base Lug** | **Protrusion Length** | **15.0 mm** | Extends radially along the **0°** axis from the Ø 69.0 mm ring (**84.0 mm** from opposite edge) |
| | **Height** | **22.0 mm** | Flush with the 22.0 mm height of the Ø 69.0 mm main collar |
| | **Width** | **22.0 mm** | Blends smoothly into the Ø 69.0 mm ring via tangent neck fillets |
| **Vertical Indexing Tongue** | **Orientation** | **Vertical blade** | Turned **90°** relative to the horizontal ring so flat faces point sideways |
| | **Protrusion Length** | **23.0 mm** | Extends radially along the **0°** axis from the 15.0 mm base lug (**107.0 mm** total overall length) |
| | **Height** | **22.0 mm** | Flush with the 22.0 mm radial base lug and main collar |
| | **Thickness (Width)** | **7.0 mm** | Centered on the 22.0 mm width of the radial base lug |
| | **Tip Profile** | **Ø 22.0 mm semicircle** | Full **R 11.0 mm** rounded end |
| **Tongue Pivot, Boss & Indexing** | **Center Pivot Bore** | **Ø 5.5 mm** | Through-hole (M5 clearance), **11.0 mm** from the rounded tip edge |
| | **Side A: Female Pocket** | **Ø 10.1 mm × 3.5 mm deep** | Slip-fit counterbore for the Ø 9.9 mm male boss on Part 2 |
| | **Side A: Indexing Pin Holes** | **9 × Ø 2.0 mm × 2.5 mm deep** | Spaced every **22.5°** across a **180°** arc around the tip |
| | **Side A: Indexing Pin Circle** | **Ø 16.0 mm BCD** | Centered on the Ø 5.5 mm pivot bore |
| | **Side B: Male Boss ("Pole")** | **Ø 9.9 mm × 3.0 mm tall** | Nominal 10.0 mm slip-fit boss protruding from the opposite face |

---

### Part 2: Male Connecting Link

| Section | Feature | Dimension | Notes & Orientation |
| :--- | :--- | :--- | :--- |
| **Main Link Body** | **Overall Length** | **92.0 mm** | Tip-to-tip overall length |
| | **Center-to-Center Distance** | **70.0 mm** | Distance between the two pivot hole centers (**92.0 − 11.0 − 11.0 mm**) |
| | **Width** | **22.0 mm** | Uniform bar width |
| | **Thickness** | **7.0 mm** | Main bar thickness (excluding the 3.0 mm protruding male bosses) |
| | **End Profile** | **Ø 22.0 mm full radius** | **R 11.0 mm** semicircular rounded ends, concentric with pivot holes |
| **Symmetrical Pivot Bores (Both Ends)** | **Pivot Through-Bore** | **Ø 5.5 mm** | Standard ISO 273 medium clearance hole for **M5** bolts |
| | **Outer Counterbore (Side B)** | **Ø 9.0 mm × 5.0 mm deep** | Seats an **M5** socket head cap screw flush (leaves **2.0 mm** web + **3.0 mm** boss) |
| **Mating Features (Side A, Both Ends)** | **Male Alignment Boss ("Pole")** | **Ø 9.9 mm × 3.0 mm tall** | Nominal **10.0 mm** slip-fit into the **Ø 10.1 mm × 3.5 mm deep** female pockets (**0.5 mm** axial clearance) |
| | **Indexing Dowel Pin Hole** | **Ø 2.0 mm × 3.0 mm deep** | Holds a press-fit **Ø 2.0 mm × 5.0 mm** dowel pin to engage the 9 indexing holes |
| | **Indexing Pin Position** | **8.0 mm radial offset** | Located along the **internal longitudinal centerline** (toward bar center, matching **Ø 16.0 mm** BCD for **0°–180°** rotation) |

---

### Part 3: Female Connecting Link (3D Print Bolt & Nut Edition)

| Section | Feature | Dimension | Notes & Orientation |
| :--- | :--- | :--- | :--- |
| **Main Link Body** | **Overall Length** | **92.0 mm** | Tip-to-tip overall length |
| | **Center-to-Center Distance** | **70.0 mm** | Distance between the two pivot hole centers (**92.0 − 11.0 − 11.0 mm**) |
| | **Width** | **22.0 mm** | Uniform bar width |
| | **Thickness** | **7.0 mm** | Main bar thickness |
| | **End Profile** | **Ø 22.0 mm full radius** | **R 11.0 mm** semicircular rounded ends, concentric with pivot holes |
| **Symmetrical Pivot Bores (Both Ends)** | **Pivot Through-Bore** | **Ø 5.5 mm** | Standard ISO 273 medium clearance hole for **M5 × 25 mm** bolt + washer + nyloc nut on back face |
| **Mating Features (Side A, Both Ends)** | **Female Alignment Pocket** | **Ø 10.1 mm × 3.5 mm deep** | Slip-fit counterbore for the **Ø 9.9 mm × 3.0 mm** male bosses on Part 1 and Part 4 (smooth face around pocket) |

---

### Part 4: T-Shaped Camera Mounting Bracket

| Section | Feature | Dimension | Notes & Orientation |
| :--- | :--- | :--- | :--- |
| **Horizontal Camera Crossbar** | **Overall Length** | **120.0 mm** | Horizontal base bar forming the top of the **T** (**±60.0 mm** from `|` centerline) |
| | **Width** | **22.0 mm** | Uniform bar width |
| | **Thickness** | **7.0 mm** | Uniform plate thickness |
| | **RealSense Datum Hole (Left)** | **1 × Ø 4.5 mm round hole** | Positioned symmetrically at **−47.5 mm** from `|` centerline (M4 clearance; centers camera in the middle) |
| | **RealSense Tolerance Slot (Right)** | **1 × (4.5 mm × 7.0 mm) slot** | Centered symmetrically at **+47.5 mm** from `|` centerline (**95.0 mm** nominal pitch; **±1.25 mm** travel; **9.0 mm** end wall) |
| | **Orbbec Datum Hole (Left)** | **1 × Ø 4.5 mm round hole** | Positioned asymmetrically at **−37.5 mm** from `|` centerline (**5.5 mm** solid wall from RealSense datum hole) |
| | **Orbbec Tolerance Slot (Right)** | **1 × (4.5 mm × 7.0 mm) slot** | Centered asymmetrically at **+23.0 mm** from `|` centerline (**60.5 mm** nominal pitch; adjustable **58.25 mm – 62.75 mm**) |
| Vertical Perpendicular Tongue | Orientation | 90° perpendicular upward | Rises vertically at 90° from the top face of the horizontal crossbar (with R 3.0 mm neck fillets at the base) |
| | Protrusion Height | 22.0 mm | Extends 22.0 mm upward from the top face of the 7.0 mm crossbar (29.0 mm total overall height) |
| | Width | 22.0 mm | Spans the full 22.0 mm width of the crossbar |
| | Thickness | 7.0 mm | Centered at the midpoint (0.0 mm) of the 120.0 mm crossbar |
| | Tip Profile | Ø 22.0 mm semicircle | Full R 11.0 mm rounded top end (pivot center sits 18.0 mm above bottom face / 11.0 mm below top tip) |
| Tongue Pivot, Boss & Indexing | Center Pivot Bore | Ø 5.5 mm | Horizontal through-hole (M5 clearance), 11.0 mm from the rounded top tip edge |
| | Side A: Female Pocket | Ø 10.1 mm × 3.5 mm deep | Slip-fit counterbore on one vertical side for the Ø 9.9 mm × 3.0 mm male boss on Part 2 |
| | Side A: Indexing Pin Holes | 9 × Ø 2.0 mm × 2.5 mm deep | Spaced every 22.5° across the 180° top semicircular arc (mates with Part 2's dowel pin) |
| | Side A: Indexing Pin Circle | Ø 16.0 mm BCD | Centered on the Ø 5.5 mm pivot bore |
| | Side B: Male Boss ("Pole") | Ø 9.9 mm × 3.0 mm tall | Nominal 10.0 mm slip-fit boss on the opposite vertical side that mates with the Ø 10.1 mm female pocket on Part 3 |
