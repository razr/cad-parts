// ============================================================================
// PART 2: MALE CONNECTING LINK (SYMMETRICAL BOTH ENDS)
// Units: millimeters (mm)
// ============================================================================

$fn = 120; // Smooth curve resolution

// --- Main Link Body ---
total_length    = 92.0;  // Tip-to-tip overall length
center_dist     = 70.0;  // Distance between pivot centers (92 - 11 - 11)
bar_width       = 22.0;  // Uniform width (Ø 22.0 mm rounded ends, R 11.0 mm)
bar_thick       = 7.0;   // Main bar thickness

// --- Symmetrical Pivot Bores & Counterbores ---
pivot_d         = 5.5;   // M5 medium clearance through-hole
cbore_d         = 9.0;   // M5 socket head cap screw counterbore diameter
cbore_depth     = 5.0;   // Leaves 2.0 mm web + 3.0 mm boss

// --- Mating Features (Top Face / Side A) ---
male_boss_d     = 9.9;   // Nominal 10.0 mm slip-fit into Ø 10.1 mm female pocket
male_boss_h     = 3.0;   // Leaves 0.5 mm axial clearance in 3.5 mm deep pocket
pin_hole_d      = 2.0;   // For press-fit Ø 2.0 mm dowel pin
pin_hole_depth  = 3.0;   // Blind hole depth
pin_offset_r    = 8.0;   // Matches Ø 16.0 mm indexing pin circle (internal centerline)

module part2_male_connecting_link() {
    half_c = center_dist / 2; // ±35.0 mm from origin

    difference() {
        union() {
            // 1. Main Link Body (92.0 x 22.0 x 7.0 mm with R 11.0 mm rounded ends)
            linear_extrude(height = bar_thick) {
                hull() {
                    translate([-half_c, 0]) circle(d = bar_width);
                    translate([ half_c, 0]) circle(d = bar_width);
                }
            }

            // 2. Symmetrical Male Alignment Bosses ("Poles": Ø 9.9 x 3.0 mm on top face)
            for (x = [-half_c, half_c]) {
                translate([x, 0, bar_thick])
                    cylinder(d = male_boss_d, h = male_boss_h);
            }
        }

        // --- SUBTRACTIVE CUTS ---

        for (x = [-half_c, half_c]) {
            // A. Central M5 Clearance Through-Bore (Ø 5.5 mm)
            translate([x, 0, -1])
                cylinder(d = pivot_d, h = bar_thick + male_boss_h + 2);

            // B. Bottom Counterbore for M5 Socket Head Cap Screw (Ø 9.0 x 5.0 mm deep)
            translate([x, 0, -0.01])
                cylinder(d = cbore_d, h = cbore_depth + 0.01);
        }

        // C. Symmetrical Dowel Pin Holes (Ø 2.0 x 3.0 mm deep on internal centerline)
        // Left end (-35 mm) pin shifts +8.0 mm toward center -> -27.0 mm
        translate([-half_c + pin_offset_r, 0, bar_thick - pin_hole_depth])
            cylinder(d = pin_hole_d, h = pin_hole_depth + 0.01);

        // Right end (+35 mm) pin shifts -8.0 mm toward center -> +27.0 mm
        translate([ half_c - pin_offset_r, 0, bar_thick - pin_hole_depth])
            cylinder(d = pin_hole_d, h = pin_hole_depth + 0.01);
    }
}

// Render Part 2 (oriented flat on bottom face with bosses pointing up for support-free printing)
part2_male_connecting_link();
