// ============================================================================
// PART 3: FEMALE CONNECTING LINK (3D PRINT BOLT & NUT EDITION)
// Units: millimeters (mm)
// ============================================================================

$fn = 120; // Smooth curve resolution

// --- Main Link Body ---
total_length    = 92.0;  // Tip-to-tip overall length
center_dist     = 70.0;  // Distance between pivot centers (92 - 11 - 11)
bar_width       = 22.0;  // Uniform width (Ø 22.0 mm rounded ends, R 11.0 mm)
bar_thick       = 7.0;   // Main bar thickness

// --- Symmetrical Pivot Bores & Female Alignment Pockets ---
pivot_d         = 5.5;   // M5 medium clearance through-hole (for M5x25 bolt + nut)
fem_pocket_d    = 10.1;  // Slip-fit for Ø 9.9 mm male bosses on Part 1 and Part 4
fem_pocket_dp   = 3.5;   // Leaves 3.5 mm solid web behind pocket (0.5 mm axial clearance)

module part3_female_connecting_link() {
    half_c = center_dist / 2; // ±35.0 mm from origin

    difference() {
        // 1. Main Link Body (92.0 x 22.0 x 7.0 mm with R 11.0 mm rounded ends)
        linear_extrude(height = bar_thick) {
            hull() {
                translate([-half_c, 0]) circle(d = bar_width);
                translate([ half_c, 0]) circle(d = bar_width);
            }
        }

        // --- SUBTRACTIVE CUTS (Both Ends Symmetrical) ---

        for (x = [-half_c, half_c]) {
            // A. Central M5 Clearance Through-Bore (Ø 5.5 mm)
            translate([x, 0, -1])
                cylinder(d = pivot_d, h = bar_thick + 2);

            // B. Top Face Female Alignment Pocket (Ø 10.1 x 3.5 mm deep)
            translate([x, 0, bar_thick - fem_pocket_dp])
                cylinder(d = fem_pocket_d, h = fem_pocket_dp + 0.01);
        }
    }
}

// Render Part 3 (oriented flat on bottom face with pockets facing up for support-free printing)
part3_female_connecting_link();
