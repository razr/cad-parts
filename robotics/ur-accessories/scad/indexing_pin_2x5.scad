// ============================================================================
// INDEXING DOWEL PIN (Ø 2.0 x 5.0 MM) FOR CAMERA MOUNT LINKAGE (PART 2)
// Units: millimeters (mm) — Print horizontally (flat on side) with 100% infill
// Note: For heavy loads, replace with DIN 7 Ø 2x5 mm steel pin or 2 mm drill shank
// ============================================================================

$fn = 60;

pin_d       = 1.95;  // Nominal Ø 2.0 mm with 0.05 mm radial print clearance
pin_length  = 5.0;   // Seats 3.0 mm deep in Part 2 + protrudes 2.0 mm into indexing holes
chamfer     = 0.35;  // Lead-in end chamfers for smooth insertion

module indexing_pin_2x5() {
    // Oriented horizontally so continuous filament lines run along the pin length
    translate([-pin_length / 2, 0, pin_d / 2 - 0.1])
        rotate([0, 90, 0])
            union() {
                cylinder(d1 = pin_d - 2 * chamfer, d2 = pin_d, h = chamfer);
                translate([0, 0, chamfer])
                    cylinder(d = pin_d, h = pin_length - 2 * chamfer);
                translate([0, 0, pin_length - chamfer])
                    cylinder(d1 = pin_d, d2 = pin_d - 2 * chamfer, h = chamfer);
            }
}

indexing_pin_2x5();
