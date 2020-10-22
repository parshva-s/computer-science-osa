void tree(float scale, float lox, float loy, float altitude /* code too broken so need to manually input this */) {
  pushMatrix();
  scale(scale);
  translate(lox, -altitude, loy);
  //trunk
  pushMatrix();
  rotateX(1.5708);
  fill(139, 69, 19);
  cylinder(10, 3, 3);
  popMatrix();
  //leaves 1st level
  pushMatrix();
  translate(0, -8, 0);
  rotateX(1.5708);
  fill(30, 255, 0); //green
  cylinder(10, 3, 7);
  popMatrix();
  //leaves 2nd level
  pushMatrix();
  translate(0, -16, 0);
  rotateX(1.5708);
  fill(30, 255, 0); //green
  cylinder(10, 3, 7);
  popMatrix();
  //leaves 3rd level
  pushMatrix();
  translate(0, -24, 0);
  rotateX(1.5708);
  fill(30, 255, 0); //green
  cylinder(10, 3, 7);
  popMatrix();
  pushMatrix();
  translate(0, -35, 0);
  rotateX(1.5708);
  fill(30, 255, 0); //green
  cylinder(15, 0, 6);
  popMatrix();
  popMatrix();
}
