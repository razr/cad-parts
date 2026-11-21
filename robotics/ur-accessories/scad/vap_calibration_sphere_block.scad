// ============================================================================
// VAP CALIBRATION SPHERE BLOCK (50 x 50 x 65 mm, Hollow Base + 5 mm Rib)
// Exact reproduction from VAP_Calibration_Sphere_Block.stl (Units: mm)
// ============================================================================

$fn = 96;

// --- Outer Platform Dimensions ---
base_w          = 50.0;   // Square base width (X = ±25.0 mm)
base_d          = 50.0;   // Square base depth (Y = ±25.0 mm)
base_h          = 25.0;   // Square base height (Z = 0 to 25.0 mm)
corner_r        = 2.0;    // Vertical corner fillet radius on base
top_chamfer     = 0.8;    // Top edge bevel around base perimeter

// --- Underside Hollow Pockets & Central Stiffener Rib ---
wall_thick      = 5.0;    // Perimeter wall thickness (inner cavity = ±20.0 mm)
top_thick       = 5.0;    // Solid top deck thickness (Z = 20.0 to 25.0 mm)
rib_thick       = 5.0;    // Central stiffener rib thickness (X = -2.5 to +2.5 mm)

// --- Stick & Reference Sphere ---
stem_d          = 10.0;   // Cylindrical stick diameter (Ø 10.0 mm)
base_fillet_r   = 4.0;    // Smooth 4.0 mm concave fillet where stick meets top deck (Ø 18.0 mm foot)
sphere_d        = 15.0;   // Calibration reference sphere diameter (Ø 15.0 mm)
total_h         = 65.0;   // Overall height from base bottom (Z=0) to sphere apex

// --- Two Top Deck Mounting Holes (centered at X = ±14.25 mm, Y = 0) ---
hole_x_offset   = 14.25;  // Hole centers at X = -14.25 mm and +14.25 mm
hole_d          = 8.0;    // Ø 8.0 mm holes through the 5.0 mm top deck

module rounded_box(w, d, h, r) {
    hull() {
        for (sx = [-1, 1], sy = [-1, 1]) {
            translate([sx * (w / 2 - r), sy * (d / 2 - r), 0])
                cylinder(r = r, h = h);
        }
    }
}

module vap_calibration_sphere_block() {
    sphere_z = total_h - sphere_d / 2; // 57.5 mm sphere center
    cavity_h = base_h - top_thick;     // 20.0 mm pocket height

    difference() {
        union() {
            // 1. 50 x 50 x 25 mm Base Block with Top Perimeter Bevel
            rounded_box(base_w, base_d, base_h - top_chamfer, corner_r);
            hull() {
                translate([0, 0, base_h - top_chamfer])
                    rounded_box(base_w, base_d, 0.01, corner_r);
                translate([0, 0, base_h - 0.01])
                    rounded_box(
                        base_w - 2 * top_chamfer,
                        base_d - 2 * top_chamfer,
                        0.01,
                        max(0.5, corner_r - top_chamfer)
                    );
            }

            // 2. Smooth 4.0 mm Concave Base Fillet Collar (Z = 25.0 to 29.0 mm)
            translate([0, 0, base_h])
                rotate_extrude(convexity = 4)
                    difference() {
                        square([stem_d / 2 + base_fillet_r, base_fillet_r]);
                        translate([stem_d / 2 + base_fillet_r, base_fillet_r])
                            circle(r = base_fillet_r);
                    }

            // 3. Ø 10.0 mm Cylindrical Stick (Z = 25.0 to 57.5 mm)
            translate([0, 0, base_h - 0.01])
                cylinder(d = stem_d, h = sphere_z - base_h + 0.01);

            // 4. Ø 15.0 mm Reference Calibration Sphere (centered at Z = 57.5 mm)
            translate([0, 0, sphere_z])
                sphere(d = sphere_d);
        }

        // --- SUBTRACTIVE CUTS ---

        // A. Two Symmetric Underside Pockets (leaving 5 mm perimeter walls + 5 mm center rib)
        pocket_w = (base_w / 2) - wall_thick - (rib_thick / 2); // 17.5 mm
        pocket_d = base_d - 2 * wall_thick;                      // 40.0 mm
        pocket_cx = (rib_thick / 2) + (pocket_w / 2);            // 11.25 mm

        for (sx = [-1, 1]) {
            translate([sx * pocket_cx - pocket_w / 2, -pocket_d / 2, -0.01])
                cube([pocket_w, pocket_d, cavity_h + 0.01]);
        }

        // B. Two Ø 8.0 mm Top Deck Holes (at X = ±14.25 mm, Y = 0)
        for (sx = [-1, 1]) {
            translate([sx * hole_x_offset, 0, cavity_h - 1])
                cylinder(d = hole_d, h = top_thick + 2);
        }
    }
}

vap_calibration_sphere_block();
