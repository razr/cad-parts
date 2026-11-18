// ============================================================================
// THREADED M8 x 1.0 PROTECTIVE DUST CAP FOR UR e-SERIES TOOL CONNECTOR
// Self-contained helical ISO M8 x 1.0 threads (no external libraries needed)
// Units: millimeters (mm) — Print at 0.12–0.16 mm layer height
// ============================================================================

$fn = 96;

// --- Configuration ---
cap_type         = "female_cap"; // ["female_cap", "male_plug"]
thread_pitch     = 1.0;          // Standard M8 x 1.0 sensor/tool connector pitch
thread_clearance = 0.25;         // Radial clearance for 3D-printed threads (mm)

outer_d          = 12.0;         // Knurled outer grip diameter
cap_height       = 12.0;         // Total height for female cap
wall_thick       = 2.0;          // End wall thickness
plug_length      = 7.0;          // Threaded length for male plug
add_tether_loop  = true;         // Side eyelet for retention cord

// --- Self-Contained Helical ISO Metric Thread Generator ---
module iso_metric_thread(d_major, pitch, length, internal = false, clearance = 0.25) {
    H = pitch * sqrt(3) / 2;
    d_adj = internal ? (d_major + 2 * clearance) : (d_major - 2 * clearance);
    r_maj = d_adj / 2;
    r_min = r_maj - 0.625 * H;

    steps_per_turn = 48;
    turns = length / pitch;
    total_steps = ceil(turns * steps_per_turn);

    // 4-point trapezoidal thread profile per turn
    // Profile points in (radius, z_offset) relative to turn start
    prof = [
        [r_min, 0.125 * pitch],
        [r_maj, 0.375 * pitch],
        [r_maj, 0.625 * pitch],
        [r_min, 0.875 * pitch]
    ];

    intersection() {
        union() {
            // Core cylinder
            cylinder(r = r_min + 0.02, h = length);

            // Swept helical thread ridge
            for (s = [0 : total_steps - 1]) {
                a0 = s * (360 / steps_per_turn);
                a1 = (s + 1) * (360 / steps_per_turn);
                z0 = (s / steps_per_turn) * pitch;
                z1 = ((s + 1) / steps_per_turn) * pitch;

                hull() {
                    rotate([0, 0, a0]) translate([0, 0, z0])
                        linear_extrude(height = 0.01)
                            polygon([
                                [r_min - 0.1, 0.125 * pitch],
                                [r_maj,       0.375 * pitch],
                                [r_maj,       0.625 * pitch],
                                [r_min - 0.1, 0.875 * pitch]
                            ]);
                    rotate([0, 0, a1]) translate([0, 0, z1])
                        linear_extrude(height = 0.01)
                            polygon([
                                [r_min - 0.1, 0.125 * pitch],
                                [r_maj,       0.375 * pitch],
                                [r_maj,       0.625 * pitch],
                                [r_min - 0.1, 0.875 * pitch]
                            ]);
                }
            }
        }
        // Trim thread cleanly to exact axial length
        cylinder(r = r_maj + 1, h = length);
    }
}

module m8_threaded_cap() {
    union() {
        if (cap_type == "female_cap") {
            difference() {
                // Outer body with top chamfer
                union() {
                    cylinder(d = outer_d, h = cap_height - 0.8);
                    translate([0, 0, cap_height - 0.8])
                        cylinder(d1 = outer_d, d2 = outer_d - 1.2, h = 0.8);
                }

                // Subtract internal M8 x 1.0 thread
                translate([0, 0, wall_thick])
                    iso_metric_thread(
                        d_major   = 8.0,
                        pitch     = thread_pitch,
                        length    = cap_height - wall_thick + 0.2,
                        internal  = true,
                        clearance = thread_clearance
                    );

                // Lead-in chamfer at mouth of thread for easy starting
                translate([0, 0, cap_height - 1.0])
                    cylinder(d1 = 7.6, d2 = 8.7, h = 1.01);
            }
        } else {
            // Male threaded plug (for female M8 port)
            cylinder(d = outer_d, h = 4.0);
            translate([0, 0, 4.0])
                iso_metric_thread(
                    d_major   = 8.0,
                    pitch     = thread_pitch,
                    length    = plug_length,
                    internal  = false,
                    clearance = thread_clearance
                );
        }

        // Knurled grip ribs around outer perimeter
        grip_h = (cap_type == "female_cap") ? (cap_height - 0.8) : 4.0;
        for (a = [0 : 30 : 330]) {
            rotate([0, 0, a])
                translate([outer_d / 2, 0, 0])
                    cylinder(d = 0.8, h = grip_h, $fn = 16);
        }

        // Optional retention tether loop
        if (add_tether_loop) {
            translate([outer_d / 2 + 1.6, 0, 0])
                difference() {
                    cylinder(d = 6.2, h = 2.0);
                    translate([0, 0, -1])
                        cylinder(d = 3.0, h = 4.0);
                }
        }
    }
}

m8_threaded_cap();

