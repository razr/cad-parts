# Orbbec Gemini 335 Stereo Depth Camera

Official vendor **STEP** model and converted **STL** mesh for the **Orbbec Gemini 335** active stereo RGB-D camera (also mechanically identical in outer housing and mounting pattern to the **Orbbec Gemini 2** and **Gemini 335L**).

---

## Folder Structure

```text
orbbec-gemini-335/
├── README.md
├── step/
│   └── orbbec_gemini_335.stp    # Official Orbbec vendor STEP model
└── stl/
    └── orbbec_gemini_335.stl    # Compiled 3D mesh for slicing / GitHub 3D preview
```

---

## Mechanical & Mounting Specifications

| Parameter | Specification | Notes |
| :--- | :--- | :--- |
| **Dimensions (W × H × D)** | **90.0 mm × 25.0 mm × 30.0 mm** | Compact aluminum housing with front optical glass window |
| **Weight** | **~164 g** | Lightweight for wrist-mounted (eye-in-hand) robotics |
| **Rear Mounting Threads** | **2 × M4** threaded holes | **60.5 mm** asymmetric hole pitch on the rear mounting face (matches **Part 4** of the [UR5 Adjustable Camera Mount](../../robotics/ur5-camera-mount/)) |
| **Bottom Mounting Thread** | **1 × 1/4"-20 UNC** | Standard tripod thread centered on the bottom face |
| **Data & Power Interface** | **USB-C 3.1 Gen 1** | Side-locking USB-C port with dual M2 screw locks |

---

## Compatible Mounts in This Repository

* **[UR5 Adjustable Camera Mount (`Part 4`)](../../robotics/ur5-camera-mount/):** Features dedicated **M4** mounting holes (`−37.5 mm` datum hole and `+23.0 mm` tolerance slot for the **60.5 mm** asymmetric pitch). Use **2 × M4 × 12 mm** DIN 912 socket head screws with **M4** washers.
