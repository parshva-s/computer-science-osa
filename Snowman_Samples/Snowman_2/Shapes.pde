void cylinder(float tall, float radius, float radiusb) {

  //variables
  float y = sin(0.3926991)*radius;
  float x = cos(0.3926991)*radius;
  float x45 = sqrt(((radius*radius)/2));
  float yb = sin(0.3926991)*radiusb;
  float xb = cos(0.3926991)*radiusb;
  float x45b = sqrt(((radiusb*radiusb)/2));
  float tall2 = tall/2;

  //top circle
  beginShape(TRIANGLE_FAN);
  vertex(0, 0, tall2);
  vertex(radius, 0, tall2);
  vertex(x, y, tall2);
  vertex(x45, x45, tall2);
  vertex(y, x, tall2);
  vertex(0, radius, tall2);
  vertex(-y, x, tall2);
  vertex(-x45, x45, tall2);
  vertex(-x, y, tall2);
  vertex(-radius, 0, tall2);
  vertex(-x, -y, tall2);
  vertex(-x45, -x45, tall2);
  vertex(-y, -x, tall2);
  vertex(0, -radius, tall2);
  vertex(y, -x, tall2);
  vertex(x45, -x45, tall2);
  vertex(x, -y, tall2);
  vertex(radius, 0, tall2);
  endShape();

  //bottom circle
  beginShape(TRIANGLE_FAN);
  vertex(0, 0, -tall2);
  vertex(radiusb, 0, -tall2);
  vertex(xb, yb, -tall2);
  vertex(x45b, x45b, -tall2);
  vertex(yb, xb, -tall2);
  vertex(0, radiusb, -tall2);
  vertex(-yb, xb, -tall2);
  vertex(-x45b, x45b, -tall2);
  vertex(-xb, yb, -tall2);
  vertex(-radiusb, 0, -tall2);
  vertex(-xb, -yb, -tall2);
  vertex(-x45b, -x45b, -tall2);
  vertex(-yb, -xb, -tall2);
  vertex(0, -radiusb, -tall2);
  vertex(yb, -xb, -tall2);
  vertex(x45b, -x45b, -tall2);
  vertex(xb, -yb, -tall2);
  vertex(radiusb, 0, -tall2);
  endShape();

  //sides
  beginShape(QUAD_STRIP);
  vertex(radius, 0, tall2);
  vertex(radiusb, 0, -tall2);
  vertex(x, y, tall2);
  vertex(xb, yb, -tall2);
  vertex(x45, x45, tall2);
  vertex(x45b, x45b, -tall2);
  vertex(y, x, tall2);
  vertex(yb, xb, -tall2);
  vertex(0, radius, tall2);
  vertex(0, radiusb, -tall2);
  vertex(-y, x, tall2);
  vertex(-yb, xb, -tall2);
  vertex(-x45, x45, tall2);
  vertex(-x45b, x45b, -tall2);
  vertex(-x, y, tall2);
  vertex(-xb, yb, -tall2);
  vertex(-radius, 0, tall2);
  vertex(-radiusb, 0, -tall2);
  vertex(-x, -y, tall2);
  vertex(-xb, -yb, -tall2);
  vertex(-x45, -x45, tall2);
  vertex(-x45b, -x45b, -tall2);
  vertex(-y, -x, tall2);
  vertex(-yb, -xb, -tall2);
  vertex(0, -radius, tall2);
  vertex(0, -radiusb, -tall2);
  vertex(y, -x, tall2);
  vertex(yb, -xb, -  tall2);
  vertex(x45, -x45, tall2);
  vertex(x45b, -x45b, -tall2);
  vertex(x, -y, tall2);
  vertex(xb, -yb, -tall2);
  vertex(radius, 0, tall2);
  vertex(radiusb, 0, -tall2);
  endShape();
}

void oval3d(float r, float x1, float y1, float z1) {
  pushMatrix();
  scale(x1, y1, z1);
  sphere(r);
  popMatrix();
}
