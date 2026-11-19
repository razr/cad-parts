// ============================================================================
// UR5 FLANGE ALIGNMENT DOWEL PIN (ISO 9409-1-50 — Ø 6.0 x 12.0 MM)
// Units: millimeters (mm) — Print horizontally (flat on side) for shear strength
// ============================================================================

$fn = 90;

pin_d       = 5.95;  // Nominal Ø 6.0 mm with 0.05 mm radial print clearance
pin_length  = 12.0;  // Standard length for UR5 flange -> Part 1 camera housing
chamfer     = 0.8;   // Lead-in end chamfers

module ur5_alignment_pin(len = pin_length, d = pin_d) {
    // Rotate horizontally so layer lines run along the pin length (prevents shearing)
    translate([-len / 2, 0, d / 2 - 0.15])
        rotate([0, 90, 0])
            difference() {
                union() {
                    cylinder(d1 = d - 2 * chamfer, d2 = d, h = chamfer);
                    translate([0, 0, chamfer])
                        cylinder(d = d, h = len - 2 * chamfer);
                    translate([0, 0, len - chamfer])
                        cylinder(d1 = d, d2 = d - 2 * chamfer, h = chamfer);
                }
                // Tiny flat air-relief channel along side for easy insertion
                translate([d / 2 - 0.2, -1.0, -1])
                    cube([1.0, 2.0, len + 2]);
            }
}

ur5_alignment_pin(pin_length, pin_d);
