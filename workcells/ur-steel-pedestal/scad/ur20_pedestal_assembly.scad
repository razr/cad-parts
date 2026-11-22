// ============================================================================
// UR20 + JUGARD+KÜNSTNER STEEL PEDESTAL ASSEMBLY
// Places the UR20 base flush on top of the 815.0 mm steel pedestal deck
// (Rotates UR20.stl +90° around X so its +Y vertical axis aligns with +Z)
// Units: millimeters (mm)
// ============================================================================

use <ur_steel_pedestal_table.scad>;

// --- Alignment Parameters ---
pedestal_top_z  = 815.0;          // Top surface height of the 10 mm steel deck
base_yaw_deg    = 0;              // Rotate robot base around Z on the table (0, 90, 180, 270)

module ur20_pedestal_assembly() {
    // 1. JUGARD+KÜNSTNER Steel Pedestal + 4x GD-60F Leveling Casters (Z = 0..815.0 mm)
    ur_steel_pedestal_table();

    // 2. Universal Robots UR20 Arm mounted on top deck (base flange at Z = 815.0 mm)
    color("LightGray")
    translate([0, 0, pedestal_top_z])
        rotate([0, 0, base_yaw_deg])
            rotate([90, 0, 0])
                import("../../../robotics/ur20/stl/UR20.stl", convexity = 10);
}

ur20_pedestal_assembly();
