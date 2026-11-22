// ============================================================================
// JUGARD+KÜNSTNER STEEL ROBOT PEDESTAL ("Robotergestell_Stahl") + 4x GD-60F CASTERS
// Drawing No.: 16342-0-00-00-0 | Total Height with Casters: 815.0 mm
// Compatible with UR20 / UR30 Base (Center Cable Hole + 6x M10 + 2x Dowels)
// Units: millimeters (mm)
// ============================================================================

use <gd60f_leveling_caster.scad>;

$fn = 64;

// --- Display & Caster Toggles ---
show_side_panels    = true;  // 4x removable sheet-metal side panels (Seitenverkleidung)
show_counterweights = true;  // 16x removable 12 kg steel counterweight plates inside base
show_casters        = true;  // 4x Xigner / GD-60F 1000 kg heavy-duty leveling casters
caster_foot_ext     = 0.0;   // [0:1:10] 0 mm = rolling on wheels (815 mm total); 4..10 mm = leveled
explode_panels      = 0;     // [0:10:150] Exploded offset for removable side panels (mm)

// --- Main Overall Dimensions ---
table_w             = 780.0; // Top plate width (X)
table_d             = 780.0; // Top plate depth (Y)
total_height        = 815.0; // Master total height from floor to top of 10 mm steel deck (815.0 mm)
caster_base_h       = 82.0;  // GD-60F rolling height (82.0 mm)
frame_h             = show_casters ? (total_height - caster_base_h) : total_height; // 733.0 mm frame
top_plate_t         = 10.0;  // 10 mm steel top plate ("Stahlplatte 10mm mit Bohrbild")
leg_inset           = 32.5;  // Frame inset from 780 mm top plate edge ((780 - 715) / 2 = 32.5 mm)
frame_w             = table_w - 2 * leg_inset; // 715.0 mm outer frame width/depth
tube_size           = 60.0;  // 60 x 60 mm square structural steel tubing
foot_plate_h        = 90.0;  // Bottom plinth clearance above caster plate
bottom_plate_t      = 8.0;   // Welded base pan ("Bodenplatte verschweißt, ca. 25kg")

// --- UR20 / UR30 Base Mounting Pattern (Center Cable Hole + 8 PCD Holes) ---
ur_cable_hole_d     = 45.0;  // Center cable pass-through bore at (0, 0)
ur_bolt_pcd         = 218.0; // Pitch circle diameter for 6x M10 + 2x Ø 8 mm dowel holes
ur_bolt_d           = 8.5;   // M10 x 1.5 tap drill diameter (Ø 8.5 mm minor thread bore)
ur_dowel_d          = 8.0;   // 2x extra Ø 8.0 mm dowel alignment pin holes (at 90° & 270°)

// --- 16x Removable Counterweight Plates ("16x Gewichtsplatten einlegbar, ca. 12kg") ---
cw_w                = 260.0;
cw_d                = 180.0;
cw_t                = 32.0;  // ~12 kg steel block each (260 x 180 x 32 mm ≈ 11.8 kg)

// --- 4x Removable Side Panels ("4x Seitenverkleidung abnehmbar") ---
panel_t             = 2.0;
panel_h             = frame_h - top_plate_t - foot_plate_h - 15.0;
panel_w             = frame_w - 2 * tube_size - 6.0;

module square_tube_x(len, size) { cube([len, size, size]); }
module square_tube_y(len, size) { cube([size, len, size]); }
module square_tube_z(len, size) { cube([size, size, len]); }

module ur_steel_pedestal_table() {
    z_lift = show_casters ? (caster_base_h + max(0, caster_foot_ext - 4.0)) : 0.0;
    deck_z = frame_h - top_plate_t; // 723.0 mm relative to frame bottom -> 805.0 mm from floor

    // Mount 4x Leveling Casters under the 4 Corner Posts
    if (show_casters) {
        for (sx = [-1 : 2 : 1], sy = [-1 : 2 : 1]) {
            cx = sx * (frame_w / 2 - tube_size / 2);
            cy = sy * (frame_w / 2 - tube_size / 2);
            translate([cx, cy, z_lift])
                gd60f_leveling_caster(foot_extension = caster_foot_ext, swivel_angle = 45);
        }
    }

    translate([0, 0, z_lift]) {
        // 1. 10 mm Steel Top Plate (Top surface sits at Z = 815.0 mm)
        color("SlateGray")
        difference() {
            translate([-table_w / 2, -table_d / 2, deck_z])
                cube([table_w, table_d, top_plate_t]);

            translate([0, 0, deck_z - 1])
                cylinder(d = ur_cable_hole_d, h = top_plate_t + 2);

            for (a = [0 : 60 : 300]) {
                rotate([0, 0, a])
                    translate([ur_bolt_pcd / 2, 0, 0]) {
                        translate([0, 0, deck_z - 1])
                            cylinder(d = ur_bolt_d, h = top_plate_t + 2);
                        translate([0, 0, deck_z + top_plate_t - 1.0])
                            cylinder(d1 = ur_bolt_d, d2 = ur_bolt_d + 2.0, h = 1.01);
                    }
            }

            for (a = [90 : 180 : 270]) {
                rotate([0, 0, a])
                    translate([ur_bolt_pcd / 2, 0, deck_z - 1])
                        cylinder(d = ur_dowel_d, h = top_plate_t + 2);
            }

            for (sx = [-1 : 2 : 1], sy = [-1 : 2 : 1]) {
                translate([sx * (table_w / 2 - 40), sy * (table_d / 2 - 40), deck_z - 1])
                    cylinder(d = 11.0, h = top_plate_t + 2);
            }
        }

        // 2. Welded Square-Tube Steel Frame
        color("DimGray") {
            for (sx = [-1 : 2 : 1], sy = [-1 : 2 : 1]) {
                px = sx * (frame_w / 2 - tube_size / 2) - tube_size / 2;
                py = sy * (frame_w / 2 - tube_size / 2) - tube_size / 2;
                translate([px, py, 0])
                    square_tube_z(deck_z, tube_size);

                // 80 x 80 x 12 mm Caster Mounting Base Plate under each corner post
                translate([px - 10, py - 10, 0])
                    cube([tube_size + 20, tube_size + 20, 12.0]);
            }

            for (hz = [foot_plate_h, deck_z / 2 + 20, deck_z - tube_size]) {
                for (sy = [-1 : 2 : 1]) {
                    translate([-(frame_w / 2 - tube_size), sy * (frame_w / 2 - tube_size / 2) - tube_size / 2, hz])
                        square_tube_x(frame_w - 2 * tube_size, tube_size);
                }
                for (sx = [-1 : 2 : 1]) {
                    translate([sx * (frame_w / 2 - tube_size / 2) - tube_size / 2, -(frame_w / 2 - tube_size), hz])
                        square_tube_y(frame_w - 2 * tube_size, tube_size);
                }
            }
        }

        // 3. Welded Bottom Counterweight Pan
        color("DarkSlateGray")
        translate([-(frame_w - 2 * tube_size) / 2, -(frame_w - 2 * tube_size) / 2, foot_plate_h])
            cube([frame_w - 2 * tube_size, frame_w - 2 * tube_size, bottom_plate_t]);

        // 4. 16x Removable Counterweight Plates
        if (show_counterweights) {
            color("SteelBlue")
            for (ix = [-1 : 2 : 1], iy = [-1 : 2 : 1], iz = [0 : 3]) {
                translate([
                    ix * (cw_w / 2 + 8) - cw_w / 2,
                    iy * (cw_d / 2 + 8) - cw_d / 2,
                    foot_plate_h + bottom_plate_t + iz * (cw_t + 1.5)
                ])
                    cube([cw_w, cw_d, cw_t]);
            }
        }

        // 5. 4x Removable Side Panels
        if (show_side_panels) {
            color("LightSteelBlue", 0.9)
            for (rot = [0 : 90 : 270]) {
                rotate([0, 0, rot])
                    translate([-panel_w / 2, -(frame_w / 2 - 4.0) - explode_panels, foot_plate_h + 8.0])
                        cube([panel_w, panel_t, panel_h]);
            }
        }
    }
}

ur_steel_pedestal_table();
