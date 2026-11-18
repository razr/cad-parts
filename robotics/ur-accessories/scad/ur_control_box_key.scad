// ============================================================================
// UNIVERSAL ROBOTS CONTROL BOX CABINET KEY (RITTAL DOUBLE-BIT 3 MM / 5 MM)
// Fits UR CB-Series & e-Series Control Boxes (Units: mm)
// Print flat on build plate in PETG / PA-CF / ASA with 100% infill
// ============================================================================

$fn = 90;

// --- Select Key Variant ("3mm" is standard for UR Rittal control boxes; "5mm" for larger cabinets) ---
key_variant     = "3mm"; // ["3mm", "5mm"]

// --- Barrel & Bit Dimensions ---
barrel_od       = 9.0;    // Outer cylinder diameter (fits Ø 10 mm lock bore)
center_pin_id   = 5.3;    // Inner bore to clear the center guide pin inside the lock
shaft_length    = 28.0;   // Total shaft reach into cabinet door
bit_length      = 12.0;   // Length of the double-bit wings
wing_span       = 13.0;   // Tip-to-tip width across both wings (2.0 mm protrusion per side)
wing_thick      = (key_variant == "3mm") ? 2.75 : 4.75; // Blade thickness with 0.25 mm print clearance

// --- Ergonomic Handle Bow ---
handle_len      = 32.0;
handle_width    = 24.0;
handle_thick    = 6.0;
keyring_hole_d  = 5.5;

module ur_control_box_key() {
    difference() {
        union() {
            // 1. Cylindrical Key Shaft
            rotate([0, 90, 0])
                cylinder(d = barrel_od, h = shaft_length);

            // 2. Double-Bit Wings at Tip of Shaft
            translate([shaft_length - bit_length, -wing_span / 2, -wing_thick / 2])
                cube([bit_length, wing_span, wing_thick]);

            // 3. Ergonomic Handle Bow (Rounded T-handle for high torque)
            hull() {
                translate([-handle_len + handle_width / 2, 0, -handle_thick / 2])
                    cylinder(d = handle_width, h = handle_thick);
                translate([-4.0, 0, -handle_thick / 2])
                    cylinder(d = barrel_od + 2.0, h = handle_thick);
            }
        }

        // --- SUBTRACTIVE CUTS ---

        // A. Center Guide Pin Bore inside Barrel Tip
        translate([shaft_length - 14.0, 0, 0])
            rotate([0, 90, 0])
                cylinder(d = center_pin_id, h = 15.0);

        // B. Lead-In Chamfer on Center Pin Bore
        translate([shaft_length - 0.8, 0, 0])
            rotate([0, 90, 0])
                cylinder(d1 = center_pin_id, d2 = center_pin_id + 1.0, h = 0.81);

        // C. Keyring Eyelet in Handle
        translate([-handle_len + 7.5, 0, -handle_thick / 2 - 1])
            cylinder(d = keyring_hole_d, h = handle_thick + 2);
    }
}

ur_control_box_key();
