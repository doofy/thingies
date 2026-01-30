magnet_width = 20;
magnet_height = 10;

module magnet(height=magnet_height, width=magnet_width) {
  roundedcube([width, width, height], true, 1);
}
