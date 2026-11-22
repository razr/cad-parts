// ============================================================================
// GD-60F / XIGNER HEAVY-DUTY LEVELING CASTER (250 kg / caster, 1000 kg / set)
// Top Plate: 73 x 73 mm (58 x 58 mm bolt pattern) | Wheel: Ø 50 x 25 mm
// Height: 82 mm (rolling) to 92 mm (leveled on NBR rubber pad)
// Units: millimeters (mm)
// ============================================================================

$fn = 64;

module gd60f_leveling_caster(foot_extension = 0, swivel_angle = 35) {
    plate_size      = 73.0;  // 73 x 73 mm steel mounting plate
    plate_t         = 4.0;   // 4.0 mm top plate thickness
    bolt_pitch      = 58.0;  // 58 x 58 mm 4-bolt hole spacing
    bolt_hole_d     = 8.5;   // M8 clearance holes
    caster_h        = 82.0;  // Base rolling height from floor to top of mounting plate
    wheel_d         = 50.0;  // Ø 50 mm nylon wheel
    wheel_w         = 25.0;  // 25 mm wheel tread width
    wheel_offset    = 36.0;  // Swivel kingpin-to-axle offset
    pad_d           = 44.0;  // Ø 44 mm anti-vibration NBR rubber leveling foot
    pad_h           = 12.0;

    // Reference Z = 0 at top mounting face of caster plate (extends downward to -Z)
    // 1. 73 x 73 mm Top Steel Mounting Plate
    color("DimGray")
    difference() {
        translate([-plate_size / 2, -plate_size / 2, -plate_t])
            cube([plate_size, plate_size, plate_t]);

        for (sx = [-1 : 2 : 1], sy = [-1 : 2 : 1]) {
            translate([sx * bolt_pitch / 2, sy * bolt_pitch / 2, -plate_t - 1])
                cylinder(d = bolt_hole_d, h = plate_t + 2);
        }
    }

    // 2. Swivel Upper Collar & Ratchet Adjustment Thumbwheel
    color("DarkSlateGray")
    translate([0, 0, -24.0])
        cylinder(d = 54.0, h = 20.0);

    color("Coral") // Adjustment dial / ratchet wheel
    translate([0, 0, -32.0])
        cylinder(d = 58.0, h = 8.0);

    // 3. Cast Aluminum Swivel Housing + Ø 50 mm Nylon Wheel
    rotate([0, 0, swivel_angle]) {
        // Housing body
        color("DimGray")
        hull() {
            translate([0, 0, -48.0])
                cylinder(d = 50.0, h = 16.0);
            translate([wheel_offset, 0, -(caster_h - wheel_d / 2)])
                rotate([90, 0, 0])
                    cylinder(d = 34.0, h = wheel_w + 12.0, center = true);
        }

        // Ø 50 x 25 mm Nylon Wheel (bottom touches Z = -82.0 mm when rolling)
        color("Ivory")
        translate([wheel_offset, 0, -(caster_h - wheel_d / 2)])
            rotate([90, 0, 0])
                cylinder(d = wheel_d, h = wheel_w, center = true);

        // Wheel Axle Bolt
        color("Silver")
        translate([wheel_offset, 0, -(caster_h - wheel_d / 2)])
            rotate([90, 0, 0])
                cylinder(d = 10.0, h = wheel_w + 15.0, center = true);
    }

    // 4. Retractable Threaded Stem & NBR Rubber Leveling Pad
    // Retracted bottom sits 4 mm above floor (-78 mm); extended reaches -(82 + foot_extension)
    pad_bottom_z = -(caster_h - 4.0 + foot_extension);

    color("Silver")
    translate([0, 0, pad_bottom_z + pad_h])
        cylinder(d = 18.0, h = (caster_h - 32.0) - pad_h + foot_extension);

    color("Black")
    translate([0, 0, pad_bottom_z])
        cylinder(d1 = pad_d, d2 = pad_d - 4.0, h = pad_h);
}

gd60f_leveling_caster(foot_extension = 0);
