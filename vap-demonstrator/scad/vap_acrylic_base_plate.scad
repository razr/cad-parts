// ============================================================================
// VAP DEMONSTRATOR ACRYLIC BASE PLATE (355.6 x 914.4 x 9.7 mm / 14" x 36")
// Parametric recreation from suda-acrylic-model.stp (Units: mm)
// ============================================================================

$fn = 96;

// --- Plate Dimensions (centered at origin) ---
plate_w         = 355.6;  // 14.0 inches
plate_l         = 914.4;  // 36.0 inches
plate_t         = 9.7;    // Acrylic sheet thickness
corner_r        = 50.8;   // 2.0 inch corner radius
bottom_chamfer  = 0.5;    // 0.5 mm bottom perimeter bevel
hole_d          = 4.4;    // 20 x Ø 4.4 mm through-holes (M4 clearance)

// --- Hole Coordinates (re-centered from STEP origin [139.45, -183.30]) ---
// 1. 12 Linear Channel Mounting Holes (6 pairs spaced 25.52 mm apart)
channel_x       = [-154.11, -128.59];
channel_y       = [-292.67, -202.67, -137.67, -63.67, 35.93, 122.33];

// 2. Two 4-Hole Mating Connector / Station Patterns (30.0 x 80.82 mm)
station_holes   = [
    // Upper Station (vertical 30.0 x 80.82 mm)
    [40.70, 269.59], [70.70, 269.59], [40.70, 350.41], [70.70, 350.41],
    // Lower Station (horizontal 80.82 x 30.0 mm)
    [15.29, -221.50], [96.11, -221.50], [15.29, -191.50], [96.11, -191.50]
];

module rounded_plate_2d(w, l, r) {
    hull() {
        for (sx = [-1, 1], sy = [-1, 1]) {
            translate([sx * (w / 2 - r), sy * (l / 2 - r)])
                circle(r = r);
        }
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
            // Main plate body (Z = 0.5 to 9.7 mm)
            translate([0, 0, bottom_chamfer])
                linear_extrude(height = plate_t - bottom_chamfer)
                    rounded_plate_2d(plate_w, plate_l, corner_r);
        }

        // Subtract 12 Channel Mounting Holes
        for (cx = channel_x, cy = channel_y) {
            translate([cx, cy, -1])
                cylinder(d = hole_d, h = plate_t + 2);
        }

        // Subtract 8 Station Mounting Holes
        for (pt = station_holes) {
            translate([pt, pt, -1])
                cylinder(d = hole_d, h = plate_t + 2);
        }
    }
}

vap_acrylic_base_plate();

