// ============================================================================
// PART 4: T-SHAPED CAMERA MOUNTING BRACKET (90° VERTICAL PERPENDICULAR TONGUE)
// Units: millimeters (mm)
// ============================================================================

$fn = 120; // Smooth curve resolution

// --- Horizontal Camera Mounting Crossbar (Flat on Table / XY Plane) ---
bar_length      = 120.0; // Total crossbar length (±60.0 mm along X)
bar_width       = 22.0;  // Crossbar width (±11.0 mm along Y)
bar_thick       = 7.0;   // Plate thickness (Z = 0 to 7.0 mm)
corner_fillet_r = 3.0;   // Clean corner rounding on crossbar ends

// --- Camera Mounting Holes & Slots (M4 Clearance = 4.5 mm) ---
cam_hole_d      = 4.5;   // M4 clearance width/diameter
slot_total_len  = 7.0;   // Total slot length (2.5 mm center-to-center travel)

// Intel RealSense D455 (Symmetric ±47.5 mm -> 95.0 mm pitch)
rs_left_x       = -47.5; // Round datum hole
rs_right_x      =  47.5; // Tolerance slot center

// Orbbec Gemini (Asymmetric -37.5 mm & +23.0 mm -> 60.5 mm nominal pitch)
orb_left_x      = -37.5; // Round datum hole
orb_right_x     =  23.0; // Tolerance slot center

// --- Vertical Perpendicular Tongue (Stands 90° Upward along +Z) ---
tongue_protrusion = 22.0; // Extends 22.0 mm upward from top face of crossbar (Z = 7.0 to 29.0 mm)
tongue_width      = 22.0; // Spans full 22.0 mm crossbar width along Y (ends in Ø 22.0 mm semicircle)
tongue_thick      = 7.0;  // 7.0 mm thick along X (X = -3.5 to +3.5 mm)
pivot_d           = 5.5;  // M5 clearance through-hole

// --- Mating Features on Vertical Tongue (Facing ±X) ---
fem_pocket_d    = 10.1;  // Side A (-X): slip-fit for Part 2 male boss
fem_pocket_dp   = 3.5;
male_boss_d     = 9.9;   // Side B (+X): slip-fit for Part 3 female pocket
male_boss_h     = 3.0;

idx_hole_d      = 2.0;   // Side A (-X): 9 indexing holes around top semicircular tip
idx_hole_dp     = 2.5;
idx_bcd         = 16.0;  // Ø 16.0 mm pin circle (8.0 mm radius)
idx_count       = 9;     // Every 22.5 deg across 180 deg top tip arc

// Derived vertical pivot coordinate
// Crossbar top is at Z = 7.0 mm; tongue tip reaches Z = 7.0 + 22.0 = 29.0 mm
// Semicircle radius is 11.0 mm, so pivot center sits at Z = 29.0 - 11.0 = 18.0 mm
pivot_z         = bar_thick + tongue_protrusion - (tongue_width / 2); // 18.0 mm

module obround_slot_2d(width, total_len) {
    c_dist = total_len - width;
    hull() {
        translate([-c_dist / 2, 0]) circle(d = width);
        translate([ c_dist / 2, 0]) circle(d = width);
    }
}

module part4_camera_bracket() {
    difference() {
        union() {
            // 1. Horizontal Crossbar (120.0 x 22.0 x 7.0 mm flat on XY plane)
            linear_extrude(height = bar_thick) {
                offset(r = corner_fillet_r) offset(r = -corner_fillet_r)
                    square([bar_length, bar_width], center = true);
            }

            // 2. Vertical Perpendicular Tongue (7.0 mm thick along X, 22.0 mm wide along Y, standing +Z)
            translate([-tongue_thick / 2, 0, 0])
                rotate([0, 90, 0])
                    linear_extrude(height = tongue_thick) {
                        union() {
                            // Rectangular base rooted into crossbar (Z = 2.0 to 18.0 mm)
                            translate([-pivot_z, -tongue_width / 2])
                                square([pivot_z - 2.0, tongue_width]);
                            // Rounded semicircular top tip (Ø 22.0 mm centered at Z = 18.0 mm)
                            translate([-pivot_z, 0])
                                circle(d = tongue_width);
                        }
                    }

            // 3. Smooth Neck Fillets at the 90° T-Junction (X = ±3.5 mm, Z = 7.0 mm)
            for (sx = [-1, 1]) {
                translate([sx * (tongue_thick / 2), -tongue_width / 2, bar_thick])
                    rotate([-90, 0, 0])
                        linear_extrude(height = tongue_width) {
                            difference() {
                                translate([sx > 0 ? 0 : -3.0, -3.0])
                                    square([3.0, 3.0]);
                                translate([sx * 3.0, -3.0])
                                    circle(r = 3.0);
                            }
                        }
            }

            // 4. Side B (+X Face): Male Alignment Boss ("Pole": Ø 9.9 x 3.0 mm)
            translate([tongue_thick / 2, 0, pivot_z])
                rotate([0, 90, 0])
                    cylinder(d = male_boss_d, h = male_boss_h);
        }

        // --- SUBTRACTIVE CUTS ---

        // A. RealSense Left Datum Hole (Ø 4.5 mm at X = -47.5 mm)
        translate([rs_left_x, 0, -1])
            cylinder(d = cam_hole_d, h = bar_thick + 2);

        // B. RealSense Right Tolerance Slot (4.5 x 7.0 mm at X = +47.5 mm)
        translate([rs_right_x, 0, -1])
            linear_extrude(height = bar_thick + 2)
                obround_slot_2d(cam_hole_d, slot_total_len);

        // C. Orbbec Left Datum Hole (Ø 4.5 mm at X = -37.5 mm)
        translate([orb_left_x, 0, -1])
            cylinder(d = cam_hole_d, h = bar_thick + 2);

        // D. Orbbec Right Tolerance Slot (4.5 x 7.0 mm at X = +23.0 mm)
        translate([orb_right_x, 0, -1])
            linear_extrude(height = bar_thick + 2)
                obround_slot_2d(cam_hole_d, slot_total_len);

        // E. Tongue Center Pivot Bore (Ø 5.5 mm through-hole along X)
        translate([-tongue_thick / 2 - 1, 0, pivot_z])
            rotate([0, 90, 0])
                cylinder(d = pivot_d, h = tongue_thick + male_boss_h + 2);

        // F. Side A (-X Face): Female Alignment Pocket (Ø 10.1 x 3.5 mm deep)
        translate([-tongue_thick / 2 - 0.01, 0, pivot_z])
            rotate([0, 90, 0])
                cylinder(d = fem_pocket_d, h = fem_pocket_dp + 0.01);

        // G. Side A (-X Face): 9 x Indexing Pin Holes (Ø 2.0 x 2.5 mm deep across top 180° tip)
        for (i = [0 : idx_count - 1]) {
            ang = i * (180 / (idx_count - 1)); // 0° (+Y) through 90° (+Z top) to 180° (-Y)
            hy = (idx_bcd / 2) * cos(ang);
            hz = pivot_z + (idx_bcd / 2) * sin(ang);
            translate([-tongue_thick / 2 - 0.01, hy, hz])
                rotate([0, 90, 0])
                    cylinder(d = idx_hole_d, h = idx_hole_dp + 0.01);
        }
    }
}

// Render Part 4
part4_camera_bracket();
