// ============================================================================
// PART 1: UR5 FLANGE EXTENSION HOUSING (ISO 9409-1-50-4-M6)
// Units: millimeters (mm)
// ============================================================================

$fn = 120; // Smooth curve resolution

// --- Main Cylindrical Body ---
outer_d         = 69.0;
collar_h        = 22.0;
skirt_d         = 63.5;
skirt_depth     = 6.0;
top_boss_d      = 63.0;
top_boss_h      = 8.0;   // Total height = 22.0 + 8.0 = 30.0 mm
center_bore_d   = 31.5;

// --- UR5 Flange Bolt Pattern ---
flange_bcd      = 50.0;
pin_hole_d      = 6.0;   // At 0, 90, 180, 270 deg (0 deg aligned with lug)
bolt_hole_d     = 7.0;   // At 45, 135, 225, 315 deg (M6 clearance)

// --- Radial Base Lug & Vertical Indexing Tongue ---
lug_protrusion  = 15.0;  // Extends from outer_d (34.5 + 15.0 = 49.5 mm)
lug_width       = 22.0;
lug_height      = 22.0;
neck_fillet_r   = 6.0;   // Smooth transition fillet into outer ring

tongue_length   = 23.0;  // Extends from base lug (49.5 + 23.0 = 72.5 mm)
tongue_thick    = 7.0;
tongue_height   = 22.0;  // Ends in Ø 22.0 mm semicircle (R 11.0 mm)

// --- Pivot Bore, Female Pocket, Indexing Holes & Male Boss ---
pivot_d         = 5.5;   // M5 clearance through-hole
fem_pocket_d    = 10.1;  // Slip-fit for Ø 9.9 mm male boss
fem_pocket_dp   = 3.5;
male_boss_d     = 9.9;
male_boss_h     = 3.0;   // Matches 3.5 mm female pockets (0.5 mm clearance)

idx_hole_d      = 2.0;
idx_hole_dp     = 2.5;
idx_bcd         = 16.0;  // 8.0 mm radius around pivot center
idx_count       = 9;     // Spaced every 22.5 deg across 180 deg tip

// Derived coordinates
ring_r          = outer_d / 2;
lug_end_x       = ring_r + lug_protrusion;          // 49.5 mm
pivot_x         = lug_end_x + tongue_length - (tongue_height / 2); // 61.5 mm
pivot_z         = tongue_height / 2;                // 11.0 mm
total_h         = collar_h + top_boss_h;            // 30.0 mm

module part1_ur5_flange_housing() {
    difference() {
        union() {
            // 1. Main 22 mm Collar + Radial Base Lug with smooth neck fillets
            linear_extrude(height = collar_h) {
                offset(r = neck_fillet_r) offset(r = -neck_fillet_r) {
                    union() {
                        circle(d = outer_d);
                        translate([0, -lug_width / 2])
                            square([lug_end_x, lug_width]);
                    }
                }
            }

            // 2. Top Male Flange Boss (Ø 63.0 x 8.0 mm)
            translate([0, 0, collar_h])
                cylinder(d = top_boss_d, h = top_boss_h);

            // 3. Vertical Indexing Tongue (7.0 mm thick, Ø 22.0 mm rounded end)
            translate([0, -tongue_thick / 2, 0])
                rotate([-90, 0, 0])
                    linear_extrude(height = tongue_thick) {
                        union() {
                            translate([lug_end_x - 2.0, -tongue_height])
                                square([pivot_x - lug_end_x + 2.0, tongue_height]);
                            translate([pivot_x, -pivot_z])
                                circle(d = tongue_height);
                        }
                    }

            // 4. Side B (+Y): Male Alignment Boss ("Pole")
            translate([pivot_x, tongue_thick / 2, pivot_z])
                rotate([-90, 0, 0])
                    cylinder(d = male_boss_d, h = male_boss_h);
        }

        // --- SUBTRACTIVE CUTS ---

        // A. Central Pilot Through-Bore (Ø 31.5 mm)
        translate([0, 0, -1])
            cylinder(d = center_bore_d, h = total_h + 2);

        // B. Bottom Female Skirt Recess (Ø 63.5 x 6.0 mm deep)
        translate([0, 0, -0.01])
            cylinder(d = skirt_d, h = skirt_depth + 0.01);

        // C. 4 x Alignment Pin Holes (Ø 6.0 mm at 0, 90, 180, 270 deg)
        for (a = [0 : 90 : 270]) {
            rotate([0, 0, a])
                translate([flange_bcd / 2, 0, -1])
                    cylinder(d = pin_hole_d, h = total_h + 2);
        }

        // D. 4 x M6 Mounting Clearance Holes (Ø 7.0 mm at 45, 135, 225, 315 deg)
        for (a = [45 : 90 : 315]) {
            rotate([0, 0, a])
                translate([flange_bcd / 2, 0, -1])
                    cylinder(d = bolt_hole_d, h = total_h + 2);
        }

        // E. Tongue Center Pivot Bore (Ø 5.5 mm through-hole)
        translate([pivot_x, -tongue_thick / 2 - 1, pivot_z])
            rotate([-90, 0, 0])
                cylinder(d = pivot_d, h = tongue_thick + male_boss_h + 2);

        // F. Side A (-Y): Female Counterbore Pocket (Ø 10.1 x 3.5 mm deep)
        translate([pivot_x, -tongue_thick / 2 - 0.01, pivot_z])
            rotate([-90, 0, 0])
                cylinder(d = fem_pocket_d, h = fem_pocket_dp + 0.01);

        // G. Side A (-Y): 9 x Indexing Pin Holes (Ø 2.0 x 2.5 mm deep across 180 deg)
        for (i = [0 : idx_count - 1]) {
            ang = -90 + i * (180 / (idx_count - 1)); // -90 to +90 deg around tip
            hx = pivot_x + (idx_bcd / 2) * cos(ang);
            hz = pivot_z + (idx_bcd / 2) * sin(ang);
            translate([hx, -tongue_thick / 2 - 0.01, hz])
                rotate([-90, 0, 0])
                    cylinder(d = idx_hole_d, h = idx_hole_dp + 0.01);
        }
    }
}

// Render Part 1
part1_ur5_flange_housing();
