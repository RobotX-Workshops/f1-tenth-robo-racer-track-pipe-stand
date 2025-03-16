// Stand for holding a pipe horizontally

// Dimensions
box_length = 200;    // mm, length along x-axis
box_width = 50;      // mm, width along y-axis
box_height = 180;    // mm, height along z-axis
hole_radius = 180;   // mm, as specified
hole_axis_z = 50 + hole_radius;  // Axis at z = 50 + 180 = 230 mm

side_triangle_width = 40;
module upside_down_triangle() {
    height=100;

    polygon(points=[[0, height], [side_triangle_width * 2, height], [side_triangle_width, 0]]);
}


// Module for the stand with customizable dimensions
module stand(box_length = 200, box_width = 50, box_height = 180, hole_radius = 180, hole_axis_z = 50 + hole_radius) {
    difference() {
        // Base box
        cube([box_length, box_width, box_height]);
        
        // Horizontal cylindrical hole along y-axis
        translate([box_length / 2, box_width / 2, hole_axis_z])
            rotate([90, 0, 0])
            cylinder(h = box_width + 10, r = hole_radius, center = true);
        
        // First triangular cut-out
        rotate([90, 0, 180])
        linear_extrude(height = box_width)
        translate([-(side_triangle_width), 0, 0])
        upside_down_triangle(height = 100, width = 55);
        
        // Second triangular cut-out
        rotate([90, 0, 180])
        linear_extrude(height = box_width)
        translate([-box_length - (side_triangle_width), 0, 0])
        upside_down_triangle(height = 100, width = 55);
    }
}

// Example usage
difference() {
    stand(); // Default stand
    translate([0, 0, -30])
    stand(); // This part seems incomplete in your original code; adjust as needed
}