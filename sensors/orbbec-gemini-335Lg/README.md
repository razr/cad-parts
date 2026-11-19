# Orbbec Gemini 335Lg GMSL2 / USB3 Stereo Depth Camera

Official vendor **STEP** model and converted **STL** mesh for the **Orbbec Gemini 335Lg** IP65 active/passive stereo RGB-D camera (`95 mm` baseline, **GMSL2 FAKRA-Z** + **USB Type-C** dual interface).

---

## Folder Structure

```text
orbbec-gemini-335Lg/
├── README.md
├── step/
│   └── orbbec_gemini_335Lg.stp    # Official Orbbec vendor STEP model
└── stl/
    └── orbbec_gemini_335Lg.stl    # Compiled 3D mesh for slicing / GitHub 3D preview
```

---

## Mechanical & Mounting Specifications

| Parameter | Specification | Notes |
| :--- | :--- | :--- |
| **Dimensions (W × H × D)** | **124.0 mm × 29.0 mm × 36.0 mm** (±0.3 mm) | IP65-rated aluminum housing with 95.0 mm stereo baseline |
| **Weight** | **164 g ± 3 g** | Lightweight for wrist-mounted (eye-in-hand) robotics |
| **Rear Mounting Threads** | **2 × M4** threaded holes (`6.0 mm` deep, max torque `0.4 N·m`) | Rear mounting interface (compatible with **Part 4** of the [UR5 Adjustable Camera Mount](../../robotics/ur5-camera-mount/)) |
| **Bottom Mounting Thread** | **1 × 1/4"-20 UNC** (`8.0 mm` deep, max torque `4.0 N·m`) | Standard tripod thread centered on the bottom face |
| **Data & Power Interfaces** | **GMSL2 (FAKRA-Z)** & **USB 3.0 Type-C** + **8-pin Sync** | Hardware DIP switch selects GMSL2 (`M`) or USB3 (`U`) mode |
| **Ingress Protection** | **IP65** | Dust-tight and water-resistant when used with IP65-rated cables |

---

## Compatible Mounts in This Repository

* **[UR5 Adjustable Camera Mount (`Part 4`)](../../robotics/ur5-camera-mount/):** Features **M4** mounting holes (`−37.5 mm` datum hole and `+23.0 mm` tolerance slot). Use **2 × M4 × 12 mm** DIN 912 socket head screws with **M4** washers (do not exceed **0.4 N·m** tightening torque on the camera's rear M4 threads).

