// ============================================================================
// VENTION ISO 50 TO ISO 80 TOOL FLANGE ADAPTOR (P/N: MO-GR-015-0080)
// Exact reproduction from Vention Blueprint Rev 1.0 (Units: mm)
// ============================================================================

$fn = 120;

// --- Three-Tier Axial Profile (Section A-A) ---
bot_boss_d      = 50.0;   // Ø 50.00 h7 bottom male pilot (Z = 0 to 6.0 mm)
bot_boss_h      = 6.0;

mid_flange_d    = 100.0;  // Ø 100.0 mm main flange disc (Z = 6.0 to 16.0 mm)
mid_flange_h    = 10.0;

top_boss_d      = 63.0;   // Ø 63.00 h8 top male pilot (Z = 16.0 to 22.0 mm)
top_boss_h      = 6.0;

total_h         = bot_boss_h + mid_flange_h + top_boss_h; // 22.0 mm
chamfer         = 0.5;

// --- Central Through-Bore ---
center_bore_d   = 31.5;   // Ø 31.50 H7 through all

// --- Inner Bolt Circle: BCD Ø 50.0 mm (ISO 50 Robot Interface) ---
iso50_bcd       = 50.0;
iso50_bolt_d    = 6.25;   // 4 x Ø 6.25 thru all (M6x1.0 Helicoil tap) at 45°, 135°, 225°, 315°
iso50_pin_d     = 6.0;    // 1 x Ø 6.00 H7 blind pin hole at 90° (+Y)
iso50_pin_dp    = 6.2;    // Depth from bottom face (Z = 0 to 6.2 mm)

// --- Outer Bolt Circle: BCD Ø 80.0 mm (ISO 80 Tool Interface) ---
iso80_bcd       = 80.0;
iso80_bolt_d    = 9.0;    // 6 x Ø 9.00 thru all at 0°, 60°, 120°, 180°, 240°, 300°
iso80_cbore_d   = 15.0;   // Ø 15.00 counterbore from top shoulder (Z = 10.0 to 16.0 mm)
iso80_cbore_dp  = 6.0;
iso80_pin_d     = 8.0;    // 1 x Ø 8.00 H7 blind pin hole at 90° (+Y)
iso80_pin_dp    = 8.0;    // Depth from bottom flange face (Z = 6.0 to 14.0 mm)

module vention_iso50_to_iso80_adaptor() {
    difference() {
        union() {
            // 1. Bottom Male Pilot Boss (Ø 50.0 x 6.0 mm, Z = 0 to 6.0 mm)
            cylinder(d1 = bot_boss_d - 2 * chamfer, d2 = bot_boss_d, h = chamfer);
            translate([0, 0, chamfer])
                cylinder(d = bot_boss_d, h = bot_boss_h - chamfer + 0.01);

            // 2. Middle Main Flange Disc (Ø 100.0 x 10.0 mm, Z = 6.0 to 16.0 mm)
            translate([0, 0, bot_boss_h]) {
                cylinder(d1 = mid_flange_d - 2 * chamfer, d2 = mid_flange_d, h = chamfer);
                translate([0, 0, chamfer])
                    cylinder(d = mid_flange_d, h = mid_flange_h - 2 * chamfer);
                translate([0, 0, mid_flange_h - chamfer])
                    cylinder(d1 = mid_flange_d, d2 = mid_flange_d - 2 * chamfer, h = chamfer);
            }

            // 3. Top Male Pilot Boss (Ø 63.0 x 6.0 mm, Z = 16.0 to 22.0 mm)
            translate([0, 0, bot_boss_h + mid_flange_h - 0.01])
                cylinder(d = top_boss_d, h = top_boss_h - chamfer + 0.01);
            translate([0, 0, total_h - chamfer])
                cylinder(d1 = top_boss_d, d2 = top_boss_d - 2 * chamfer, h = chamfer);
        }

        // --- SUBTRACTIVE CUTS ---

        // A. Central Through-Bore (Ø 31.50 H7 thru all)
        translate([0, 0, -1])
            cylinder(d = center_bore_d, h = total_h + 2);

        // B. ISO 50 BCD (Ø 50.0 mm): 4 x Ø 6.25 Thru-All Holes at 45°, 135°, 225°, 315°
        for (a = [45 : 90 : 315]) {
            rotate([0, 0, a])
                translate([iso50_bcd / 2, 0, -1])
                    cylinder(d = iso50_bolt_d, h = total_h + 2);
        }

        // C. ISO 50 BCD (Ø 50.0 mm): 1 x Ø 6.00 H7 x 6.20 Deep Blind Pin Hole at 90° (+Y)
        translate([0, iso50_bcd / 2, -0.01])
            cylinder(d = iso50_pin_d, h = iso50_pin_dp + 0.01);

        // D. ISO 80 BCD (Ø 80.0 mm): 6 x Ø 9.00 Thru + Ø 15.00 x 6.00 Counterbores
        for (a = [0 : 60 : 300]) {
            rotate([0, 0, a])
                translate([iso80_bcd / 2, 0, 0]) {
                    translate([0, 0, bot_boss_h - 1])
                        cylinder(d = iso80_bolt_d, h = mid_flange_h + 2);
                    translate([0, 0, bot_boss_h + mid_flange_h - iso80_cbore_dp])
                        cylinder(d = iso80_cbore_d, h = iso80_cbore_dp + 0.01);
                }
        }

        // E. ISO 80 BCD (Ø 80.0 mm): 1 x Ø 8.00 H7 x 8.00 Deep Blind Pin Hole at 90° (+Y)
        translate([0, iso80_bcd / 2, bot_boss_h - 0.01])
            cylinder(d = iso80_pin_d, h = iso80_pin_dp + 0.01);
    }
}

vention_iso50_to_iso80_adaptor();
