// Stand for holding a pipe horizontally

// Dimensions
box_length = 200;    // mm, length along x-axis
box_width = 50;      // mm, width along y-axis
box_height = 180;    // mm, height along z-axis
hole_radius = 180;   // mm, as specified
hole_axis_z = 50 + hole_radius;  // Axis at z = 50 + 180 = 230 mm

// Create the stand with a horizontal through-hole
difference() {
    // Base box
    cube([box_length, box_width, box_height]);
    
    // Horizontal cylindrical hole along y-axis
    translate([box_length / 2, box_width / 2, hole_axis_z]) // Center in x and y, axis at z=230
        rotate([90, 0, 0]) // Rotate to align along y-axis
        cylinder(h=box_width + 10, r=hole_radius, center=true); // Length > 50 mm to cut through
}