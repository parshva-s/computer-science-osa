/* ***********************************************************************
 * Caleb Ji
 * Exercise 6 - Robot 3: Response
 * CS 10
 * Friday, April 17 2020
 
 * This program is my own work - CJ - (portion of code copied from Chapter 3) */

float x = 230; // x-coordinate
float y = 317; // y-coordinate
int bodyHeight = 110; // Body Height
float neckHeight = y - 100; // Neck Height
int headRadius = 45; // Head Radius

float easing = 0.05; //easing
Boolean isShort = false;

void setup() {
  size(720, 600);
  smooth();
}

void draw() {
  float targetX = mouseX;
  x += (targetX - x) * easing;
  
  
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
  // Neck
  stroke(0, 255, 0); // Set stroke to gray
  line(x + 36, y, x+36, y - neckHeight); // Left
  line(x + 46, y, x+46, y - neckHeight); // Middle
  line(x + 56, y, x+56, y - neckHeight); // Right
  // Antennae
  stroke(#F0A400);
  line(x + 46, y-neckHeight, x - 20, y-neckHeight+80); // Small
  line(x + 46, y-neckHeight, x + 46, y-neckHeight-80); // Tall
  line(x + 46, y-neckHeight, x + 112, y-neckHeight+70); // Medium
  // Body
  noStroke(); // Disable stroke
  fill(102); // Set fill to gray
  ellipse(x + 20, y+bodyHeight+10, 10, 10); // Antigravity orb
  ellipse(x + 70, y+bodyHeight + 10, 10, 10);
  fill(0); // Set fill to black
  rect(x, y, 90, bodyHeight); // Main body
  fill(102); // Set fill to gray
  rect(x, y+17, 90, 6); // Gray stripe
  stroke(102);
  line(x, y+17, x - 65, y+43); //top left arm
  line(x - 65, y+43, x - 100, y+18); //top left arm
  line(x + 90, y+13, x + 155, y+38);//top right arm
  line(x + 155, y+38, x + 185, y+28);//top right arm
  line(x, y+33, x - 65, y+73);//bottom right
  line(x - 65, y+73, x - 120, y+33);//bottom right
  line(x + 90, y+33, x + 140, y+73);//bottom left
  line(x + 140, y+73, x + 220, y+43); // bottom left
  stroke(0);
  strokeWeight(7);
  line(x - 100, y-7, x - 100, y+43);
  //red
  stroke(255, 0, 0);
  line(x - 100, y-10, x-100, y-157);
  stroke(0);
  line(x + 200, y-7, x+180, y+43);
  //purple
  stroke(125, 0, 175);
  line(x + 200, y-7, x + 255, y-147);
  stroke(0);
  line(x + 225, y+13, x+215, y+63);
  line(x - 130, y+13, x - 110, y+63);
  stroke(#0548FA);
  line(x + 225, y + 13, x + 255, y - 137);
  stroke(#0548FA);
  line(x - 130, y+13, x-180, y-112);

  // Head
  noStroke();
  fill(#D2B48C); // Set fill to black
  ellipse(x + 46, y - neckHeight, headRadius, headRadius); // Head
  fill(255); // Set fill to white
  ellipse(x + 58, y-neckHeight, 14, 14); // Large eye
  fill(0); // Set fill to black
  ellipse(x + 58, y - neckHeight, 3, 3); // Pupil
  fill(153); // Set fill to light gray
  ellipse(x + 33, y - neckHeight, 5, 5); // Small eye 1
  ellipse(x + 66, y - neckHeight - 20, 4, 4); // Small eye 2
  ellipse(x + 75, y - neckHeight + 20, 3, 3); // Small eye 3
  fill(0);
  text("Hello There General Kenobi", 300, 200);
}


//mousePressed

void mousePressed() {
    if (isShort){
      y=317;
      bodyHeight = 110;
      neckHeight = 217;
      isShort = false;
    } else{
      y = 387;
      bodyHeight  =40;
      neckHeight = 147;
      isShort = true;
    }
}
