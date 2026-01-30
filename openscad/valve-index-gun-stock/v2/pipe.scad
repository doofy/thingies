profile_size = 25;

module pipe(fill = 1) {
  pipe_length = 800;
  pipe_wall_thickness = 1.5;
  pipe_corner_radius = 2;

  if (fill) {
    roundedcube([profile_size, pipe_length, profile_size], true, pipe_corner_radius, "y");
  }
  else {
    difference() {
      roundedcube([profile_size, pipe_length, profile_size], true, pipe_corner_radius, "y");
      roundedcube([profile_size - pipe_wall_thickness, pipe_length * 1.1, profile_size - pipe_wall_thickness], true, pipe_corner_radius, "y");
    }
  }
}
