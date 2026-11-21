// ============================================================================
// VAP DEMONSTRATOR ACRYLIC BASE PLATE (355.6 x 914.4 x 12.7 mm / 14" x 36" x 0.5")
// Exact centered reconstruction from vap_acrylic_base_plate.stp (Units: mm)
// ============================================================================

$fn = 96;

// --- Plate Dimensions (centered at origin) ---
plate_w         = 355.6;  // 14.0 inches (X = -177.8 to +177.8 mm)
plate_l         = 914.4;  // 36.0 inches (Y = -457.2 to +457.2 mm)
plate_t         = 12.7;   // 0.50 inches acrylic sheet thickness
corner_r        = 50.8;   // 2.0 inch corner radius
bottom_chamfer  = 0.5;    // 0.5 mm bottom perimeter bevel

// --- Counterbored M4 Hole Specifications (20 holes total) ---
hole_d          = 4.4;    // Ø 4.40 mm M4 through-hole
cbore_d         = 8.5;    // Ø 8.50 mm socket-head counterbore
cbore_depth     = 4.5;    // Counterbore depth from top face (Z = 8.2 to 12.7 mm)

// --- Exact Centered Hole Coordinates (relative to STEP midpoint [114.05, -183.30]) ---
// 1. 12 Linear Channel Mounting Holes (6 pairs spaced 25.52 mm apart)
channel_x       = [-128.71, -103.19];
channel_y       = [-292.67, -202.67, -137.67, -63.67, 35.93, 122.33];

// 2. Two 4-Hole Mating Connector / Station Patterns (30.0 x 80.82 mm)
station_holes   = [
    // Upper Station (vertical 30.0 x 80.82 mm)
    [66.10, 269.59], [96.10, 269.59], [66.10, 350.41], [96.10, 350.41],
    // Lower Station (horizontal 80.82 x 30.0 mm)
    [40.69, -221.50], [121.51, -221.50], [40.69, -191.50], [121.51, -191.50]
];

module rounded_plate_2d(w, l, r) {
    hull() {
        for (sx = [-1, 1], sy = [-1, 1]) {
            translate([sx * (w / 2 - r), sy * (l / 2 - r)])
                circle(r = r);
        }
    }
}

module m4_cbore_hole(x, y) {
    translate([x, y, 0]) {
        // Ø 4.40 mm through-hole
        translate([0, 0, -1])
            cylinder(d = hole_d, h = plate_t + 2);
        // Ø 8.50 mm counterbore on top face
        translate([0, 0, plate_t - cbore_depth])
            cylinder(d = cbore_d, h = cbore_depth + 0.01);
    }
}

module vap_acrylic_base_plate() {
    difference() {
        union() {
            // Bottom chamfered lip (Z = 0 to 0.5 mm)
            hull() {
                linear_extrude(height = 0.01)
                    rounded_plate_2d(plate_w - 2 * bottom_chamfer, plate_l - 2 * bottom_chamfer, corner_r - bottom_chamfer);
                translate([0, 0, bottom_chamfer])
                    linear_extrude(height = 0.01)
                        rounded_plate_2d(plate_w, plate_l, corner_r);
            }
            // Main plate body (Z = 0.5 to 12.7 mm)
            translate([0, 0, bottom_chamfer])
                linear_extrude(height = plate_t - bottom_chamfer)
                    rounded_plate_2d(plate_w, plate_l, corner_r);
        }

        // Subtract 12 Channel Mounting Holes
        for (cx = channel_x, cy = channel_y) {
            m4_cbore_hole(cx, cy);
        }

        // Subtract 8 Station Mounting Holes
        for (pt = station_holes) {
            m4_cbore_hole(pt[0], pt[1]);
        }
    }
}

vap_acrylic_base_plate();
