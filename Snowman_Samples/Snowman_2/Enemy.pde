void enemy() {
  pushMatrix();
  fill(0, 0, 255);
  oval3d(3, 1, 1, 2);
  translate(0, 0, 10);
  rotateX(rad(180));
  fill(0);
  cylinder(10, 1, 0);
  popMatrix();
}
