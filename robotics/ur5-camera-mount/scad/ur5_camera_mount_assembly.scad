// ============================================================================
// COMPLETE UR5 CAMERA MOUNT ASSEMBLY (USING EXACT PART 4 GEOMETRY)
// Units: millimeters (mm)
// ============================================================================

// Set explode = 0 for assembled fit check, or > 0 (e.g., 20) for exploded view
explode = 0; // [0:1:40]

// Angle of the connecting arm (in steps of 22.5° from -90° to +90°)
arm_angle = 45; // [-90:22.5:90]

// Tilt angle of the camera T-bracket relative to the flange (0° = parallel to flange)
bracket_angle = 0; // [-90:22.5:90]

$fn = 90;

// --- Shared Dimensions ---
bar_thick       = 7.0;
bar_width       = 22.0;
center_dist     = 70.0;
pivot_d         = 5.5;
fem_pocket_d    = 10.1;
fem_pocket_dp   = 3.5;
male_boss_d     = 9.9;
male_boss_h     = 3.0;
idx_hole_d      = 2.0;
idx_hole_dp     = 2.5;
idx_bcd         = 16.0;
idx_count       = 9;

// Key coordinates for Part 1 pivot axis
p1_lug_end_x    = (69.0 / 2) + 15.0;          // 49.5 mm
p1_pivot_x      = p1_lug_end_x + 23.0 - 11.0; // 61.5 mm
p1_pivot_z      = 11.0;

module obround_slot_2d(width, total_len) {
    c_dist = total_len - width;
    hull() {
        translate([-c_dist / 2, 0]) circle(d = width);
        translate([ c_dist / 2, 0]) circle(d = width);
    }
}

// ============================================================================
// PART 1: UR5 FLANGE EXTENSION HOUSING
// ============================================================================
module part1() {
    color("SlateGray")
    difference() {
        union() {
            linear_extrude(height = 22.0)
                offset(r = 6.0) offset(r = -6.0) {
                    circle(d = 69.0);
                    translate([0, -11.0]) square([p1_lug_end_x, 22.0]);
                }
            translate([0, 0, 22.0]) cylinder(d = 63.0, h = 8.0);
            translate([0, -3.5, 0]) rotate([-90, 0, 0])
                linear_extrude(height = 7.0) {
                    translate([p1_lug_end_x - 2.0, -22.0]) square([p1_pivot_x - p1_lug_end_x + 2.0, 22.0]);
                    translate([p1_pivot_x, -11.0]) circle(d = 22.0);
                }
            // Side B (+Y): Male Boss
            translate([p1_pivot_x, 3.5, p1_pivot_z]) rotate([-90, 0, 0])
                cylinder(d = male_boss_d, h = male_boss_h);
        }
        translate([0, 0, -1]) cylinder(d = 31.5, h = 32.0);
        translate([0, 0, -0.01]) cylinder(d = 63.5, h = 6.01);
        for (a = [0 : 90 : 270]) rotate([0, 0, a]) translate([25.0, 0, -1]) cylinder(d = 6.0, h = 32.0);
        for (a = [45 : 90 : 315]) rotate([0, 0, a]) translate([25.0, 0, -1]) cylinder(d = 7.0, h = 32.0);
        translate([p1_pivot_x, -4.5, p1_pivot_z]) rotate([-90, 0, 0]) cylinder(d = pivot_d, h = 12.0);
        // Side A (-Y): Female Pocket + 9 Indexing Holes
        translate([p1_pivot_x, -3.51, p1_pivot_z]) rotate([-90, 0, 0]) cylinder(d = fem_pocket_d, h = fem_pocket_dp + 0.01);
        for (i = [0 : idx_count - 1]) {
            ang = -90 + i * (180 / (idx_count - 1));
            translate([p1_pivot_x + 8.0 * cos(ang), -3.51, p1_pivot_z + 8.0 * sin(ang)])
                rotate([-90, 0, 0]) cylinder(d = idx_hole_d, h = idx_hole_dp + 0.01);
        }
    }
}

// ============================================================================
// PART 2: MALE CONNECTING LINK
// ============================================================================
module part2() {
    color("SteelBlue")
    difference() {
        union() {
            linear_extrude(height = bar_thick)
                hull() {
                    circle(d = bar_width);
                    translate([center_dist, 0]) circle(d = bar_width);
                }
            for (x = [0, center_dist])
                translate([x, 0, bar_thick]) cylinder(d = male_boss_d, h = male_boss_h);
        }
        for (x = [0, center_dist]) {
            translate([x, 0, -1]) cylinder(d = pivot_d, h = 12.0);
            translate([x, 0, -0.01]) cylinder(d = 9.0, h = 5.01);
        }
        translate([8.0, 0, bar_thick - 3.0]) cylinder(d = 2.0, h = 3.01);
        translate([center_dist - 8.0, 0, bar_thick - 3.0]) cylinder(d = 2.0, h = 3.01);
    }
}

// ============================================================================
// PART 3: FEMALE CONNECTING LINK
// ============================================================================
module part3() {
    color("CornflowerBlue")
    difference() {
        linear_extrude(height = bar_thick)
            hull() {
                circle(d = bar_width);
                translate([center_dist, 0]) circle(d = bar_width);
            }
        for (x = [0, center_dist]) {
            translate([x, 0, -1]) cylinder(d = pivot_d, h = 9.0);
            translate([x, 0, bar_thick - fem_pocket_dp]) cylinder(d = fem_pocket_d, h = fem_pocket_dp + 0.01);
        }
    }
}

// ============================================================================
// PART 4: YOUR EXACT 90° VERTICAL PERPENDICULAR TONGUE BRACKET
// ============================================================================
module part4_camera_bracket() {
    p4_bar_len      = 120.0;
    p4_bar_w        = 22.0;
    p4_bar_t        = 7.0;
    p4_corner_r     = 3.0;
    p4_tongue_h     = 22.0;
    p4_tongue_w     = 22.0;
    p4_tongue_t     = 7.0;
    p4_pivot_z      = p4_bar_t + p4_tongue_h - (p4_tongue_w / 2); // 18.0 mm

    color("DimGray")
    difference() {
        union() {
            // 1. Horizontal Crossbar (120.0 x 22.0 x 7.0 mm flat on XY plane)
            linear_extrude(height = p4_bar_t) {
                offset(r = p4_corner_r) offset(r = -p4_corner_r)
                    square([p4_bar_len, p4_bar_w], center = true);
            }

            // 2. Vertical Perpendicular Tongue (7.0 mm thick along X, 22.0 mm wide along Y, standing +Z)
            translate([-p4_tongue_t / 2, 0, 0])
                rotate([0, 90, 0])
                    linear_extrude(height = p4_tongue_t) {
                        union() {
                            translate([-p4_pivot_z, -p4_tongue_w / 2])
                                square([p4_pivot_z - 2.0, p4_tongue_w]);
                            translate([-p4_pivot_z, 0])
                                circle(d = p4_tongue_w);
                        }
                    }

            // 3. Smooth Neck Fillets at the 90° T-Junction
            for (sx = [-1, 1]) {
                translate([sx * (p4_tongue_t / 2), -p4_tongue_w / 2, p4_bar_t])
                    rotate([-90, 0, 0])
                        linear_extrude(height = p4_tongue_w) {
                            difference() {
                                translate([sx > 0 ? 0 : -3.0, -3.0])
                                    square([3.0, 3.0]);
                                translate([sx * 3.0, -3.0])
                                    circle(r = 3.0);
                            }
                        }
            }

            // 4. Side B (+X Face): Male Alignment Boss ("Pole": Ø 9.9 x 3.0 mm)
            translate([p4_tongue_t / 2, 0, p4_pivot_z])
                rotate([0, 90, 0])
                    cylinder(d = male_boss_d, h = male_boss_h);
        }

        // Camera Mounting Holes
        translate([-47.5, 0, -1]) cylinder(d = 4.5, h = p4_bar_t + 2);
        translate([ 47.5, 0, -1]) linear_extrude(height = p4_bar_t + 2) obround_slot_2d(4.5, 7.0);
        translate([-37.5, 0, -1]) cylinder(d = 4.5, h = p4_bar_t + 2);
        translate([ 23.0, 0, -1]) linear_extrude(height = p4_bar_t + 2) obround_slot_2d(4.5, 7.0);

        // Tongue Center Pivot Bore
        translate([-p4_tongue_t / 2 - 1, 0, p4_pivot_z])
            rotate([0, 90, 0])
                cylinder(d = pivot_d, h = p4_tongue_t + male_boss_h + 2);

        // Side A (-X Face): Female Alignment Pocket
        translate([-p4_tongue_t / 2 - 0.01, 0, p4_pivot_z])
            rotate([0, 90, 0])
                cylinder(d = fem_pocket_d, h = fem_pocket_dp + 0.01);

        // Side A (-X Face): 9 x Indexing Pin Holes
        for (i = [0 : idx_count - 1]) {
            ang = i * (180 / (idx_count - 1));
            hy = (idx_bcd / 2) * cos(ang);
            hz = p4_pivot_z + (idx_bcd / 2) * sin(ang);
            translate([-p4_tongue_t / 2 - 0.01, hy, hz])
                rotate([0, 90, 0])
                    cylinder(d = idx_hole_d, h = idx_hole_dp + 0.01);
        }
    }
}

// ============================================================================
// HARDWARE: M5x25 SOCKET HEAD BOLT, WASHER, NYLOC NUT & Ø2x5 DOWEL PIN
// ============================================================================
module m5_bolt_and_nut() {
    color("Silver") {
        translate([0, -10.5 - explode * 2, 0]) rotate([-90, 0, 0])
            difference() {
                cylinder(d = 8.5, h = 5.0);
                translate([0, 0, 2.5]) cylinder(d = 4.6, h = 3.0, $fn = 6);
            }
        translate([0, -5.5 - explode * 2, 0]) rotate([-90, 0, 0])
            cylinder(d = 5.0, h = 25.0);
    }
    color("LightGrey") {
        translate([0, 10.5 + explode * 2, 0]) rotate([-90, 0, 0]) cylinder(d = 10.0, h = 1.0);
        translate([0, 11.5 + explode * 2.5, 0]) rotate([-90, 0, 0])
            difference() {
                cylinder(d = 9.2, h = 5.0, $fn = 6);
                translate([0, 0, -1]) cylinder(d = 5.0, h = 7.0);
            }
    }
}

module dowel_pin_2x5() {
    color("Gold")
    rotate([-90, 0, 0]) cylinder(d = 2.0, h = 5.0);
}

// ============================================================================
// ASSEMBLE ALL PARTS
// ============================================================================
part1();

// Rotate the entire linkage arm around Part 1's pivot center
translate([p1_pivot_x, 0, p1_pivot_z])
rotate([0, -arm_angle, 0]) {
    // Part 2 (Male Link) on Side A (-Y) of Part 1
    translate([0, -3.5 - bar_thick - explode, 0])
        rotate([-90, 0, 0])
            part2();

// 2 x Ø 2.0 x 5.0 mm Dowel Pins seated in Part 2
translate([8.0, -3.5 - 3.0 - explode * 0.6, 0]) dowel_pin_2x5();
translate([center_dist - 8.0, -3.5 - 3.0 - explode * 0.6, 0]) dowel_pin_2x5();
// Part 3 (Female Link) on Side B (+Y) of Part 1
translate([0, 3.5 + bar_thick + explode, 0])
rotate([90, 0, 0])
part3();
// Part 4 (Your exact bracket):
// 1. Shift pivot center (Z=18) to origin: translate([0, 0, -18])
// 2. Rotate 90° around Z so Side A (-X) faces Part 2 (-Y) & Side B (+X) faces Part 3 (+Y)
// 3. Flip 180° around Y so the crossbar sits at the top (+Z) parallel to the flange!
translate([center_dist, 0, 0])
rotate([0, arm_angle + bracket_angle, 0])
rotate([0, 180, 90])
translate([0, 0, -18.0])
part4_camera_bracket();
// 2 x M5x25 Bolts + Washers + Nyloc Nuts at both pivot joints
translate([0, 0, 0]) m5_bolt_and_nut();
translate([center_dist, 0, 0]) m5_bolt_and_nut();
}

