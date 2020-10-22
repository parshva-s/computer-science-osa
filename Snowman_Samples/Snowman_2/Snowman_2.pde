float spot1 = -70;
float spot2 = 70;
float lightStrength = 0;
float i = 0;
int deg = 30;
boolean start = false;
float x = 0;
float z = 0;
float xLoc = 0;
float zLoc = 0;
float heading = 0;
float snowmanLocation = 0;
boolean[] keys;
float debug = 0;
float yRot = 0;
float snowX = 0;
float snowZ = 0;
float x1 = 0;
float z1 = 0;
float[] enemyX;
float[] enemyY;
float rand;
float[] eneDirec;
float hypo;
int spawn;
boolean[] boolSpawn;
boolean[] boolSpawn2;
int initialTime;
float xEne, yEne;
int spawnNum = 0;
boolean a = true;
boolean shoot = false;
float bulletDirec;
float bulletX, bulletY;
boolean bulletExi;
boolean started = false;
boolean lost = false;
boolean win, lose;

void setup() {
  size(700, 700, P3D);
  background(0);
  keys = new boolean[3];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  enemyX = new float[9];
  enemyY = new float[9];
  eneDirec = new float[9];
  boolSpawn = new boolean[9];
  boolSpawn2 = new boolean[9];
}

void draw() {
  camCalculate();
  background(0);
  noStroke();

  //camera
  if (millis() > 2999 && millis() < 6000) {
    camera(0, 0, 70, 0, 0, 0, 0, 1, 0);
  }
  if (millis() > 5999) {  //replace 5999
    if (start == false) {
      camera(75, 0, 75, 0, 0, 0, 0, 1, 0);
    } else {
      lights();
    }
  }
  if (millis() < 3000) {
    camera(70, 0, 0, 0, 0, 0, 0, 1, 0);
  }
  if (millis() > 5999) {
    if (start == true) {
      //camera(xLoc, -15, zLoc, snowX, 0, snowZ, 0, 1, 0);
    }
  }

  //lighting
  if (millis() < 3000) {
    spotLight(255, 255, 255, 0, spot1, 600, 0, 0, -1, PI/2, 800);
    spot1 += 3;
  }
  if (millis() > 2999 && millis() < 6000) {
    spotLight(255, 255, 255, 0, spot2, 600, 0, 0, -1, PI/2, 800);
    spot2 -= 1.5;
  }
  if (millis() > 5999) { //replace 5999
    if (start == false) {
      directionalLight(lightStrength, lightStrength, lightStrength, 0, 0, -1);
      if (lightStrength < 255) {
        lightStrength++;
      }
    }
  }
  if (millis() > 0) {
    if (start == true) {
      lights();
    }
  }

  //camera after 6 seconds
  if (millis() > 5999) {
    if (start == true) {
      camera(xLoc, -15, zLoc, snowX, 0, snowZ, 0, 1, 0);
    }
  }

  //enemy

  if (spawnNum != 8) {
    if (millis() >= 5999 && start == true) {
      if (a == true) {
        initialTime = millis();
        a = false;
      }
      if (initialTime + 5999 < millis()) {
        initialTime = millis();
        spawnNum++;
        enemyLoc(spawnNum);
        boolSpawn[spawnNum] = true;
        if (spawnNum == 8) {
        }
      }
    }
  } else {
    if (lost == false) {
      if (boolSpawn[8] == false) {
        println("You win");
      }
    }
  }

  if (millis() >= 5999 && start == true) {
    for (int i = 0; i <= 8; i++) {
      if (boolSpawn[i] == true) {
        enemyDirec();
        pushMatrix();
        enemyLocation(i);
        enemyTranslate(i);
        rotateY(-eneDirec[i] - rad(90));
        enemy();
        popMatrix();
      }
    }
  }

  //shoot
  if (shoot == true) {
    bulletDirec = heading;
    shoot = false;
    bulletExi = true;
    bulletX = snowX;
    bulletY = snowZ;
  }
  if (bulletExi == true) {
    pushMatrix();
    bulletMove();
    translate(bulletX, 0, bulletY);
    bullet();
    popMatrix();
    //check bullet hit
    for (int i = 0; i <= 8; i++) {
      if (boolSpawn[i] == true) {
        if (dist(enemyX[i], 0, enemyY[i], bulletX, 0, bulletY) < 5) {
          bulletExi = false;
          boolSpawn[i] = false;
        }
      }
    }
  }

  //check if hit
  for (int i = 0; i <= 8; i++) {
    if (boolSpawn[i] == true) {
      if (dist(enemyX[i], 0, enemyY[i], snowX, 0, snowZ) < 5) {
        boolSpawn[i] = false;
        println("You lose");
        lost = true;
      }
    }
  }


  //snowman

  pushMatrix();

  //snowman movement

  //fowards
  if (keys[0]) {
    snowmamCalculate();
  }
  translate(snowX, 0, snowZ);

  //rotate
  if (keys[1]) {
    yRot++;
    heading++;
  }
  if (keys[2]) {
    yRot--;
    heading--;
  }
  rotateY(yRot * 3.1415/180);

  fill(255);

  //body
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, 10, 0);
  sphere(8);
  popMatrix();
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -3.5, 0);
  sphere(5.5);
  popMatrix();
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -12.5, 0);
  sphere(3.5);
  popMatrix();

  //buttons
  fill(100);
  pushMatrix();
  translate(0, snowmanLocation, 4.1);
  sphere(0.5);
  popMatrix();
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -3, 5.3);
  sphere(0.5);
  popMatrix();
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -6, 4.7);
  sphere(0.5);
  popMatrix();

  //nose
  fill(255, 100, 0);
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -11.5, 3);
  sphere(0.7);
  translate(0, 0, 0.5);
  sphere(0.6);
  translate(0, 0, 0.45);
  sphere(0.5);
  translate(0, 0, 0.4);
  sphere(0.4);
  translate(0, 0, 0.35);
  sphere(0.3);
  translate(0, 0, 0.3);
  sphere(0.2);
  translate(0, 0, 0.25);
  sphere(0.1);
  popMatrix();

  //eyes
  fill(0);
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(1, -13.3, 3.2);
  sphere(0.6);
  translate(-2, 0, 0);
  sphere(0.6);
  popMatrix();

  //arms
  fill(139, 69, 19); //brown
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(9, -8, 0);
  rotateZ(radians(-30));
  box(10, 0.5, 0.5);
  popMatrix();
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(-9, -8, 0);
  rotateZ(radians(30));
  box(10, 0.5, 0.5);
  popMatrix();

  //scarf
  fill(255, 0, 0);
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -9, 0);
  rotateX(1.5708);
  cylinder(1, 3, 3);
  popMatrix();

  //hat
  fill(150);
  pushMatrix();
  translate(0, snowmanLocation, 0);
  translate(0, -16.5, 0);
  rotateX(1.5708);
  cylinder(3, 2, 2);
  popMatrix();

  popMatrix();

  //ground
  pushMatrix();
  translate(0, 17, 0);
  oval3d(500, 1, 0, 1);
  popMatrix();


  //all code after 6 seconds
  if (millis() > 5999) {
    if (start == true) {

      //trees

      tree(1.2, 30, 30, -10);
      tree(0.9, -30, 30, -15);
      tree(1.5, 45, 17, -10);
    }
  }
  //println (eneDirec[1]);
}

void keyPressed() {
  if (start == true) {
    if (key == 'w') {
      keys[0] = true;
    }

    if (key == 'a') {
      keys[1] = true;
    }

    if (key == 'd') {
      keys[2] = true;
    }
    if (key == 'h') {
      if (bulletExi == false) {
        shoot = true;
      }
    }
    if (key == 'j') {
      if (bulletExi == true) {
        bulletExi = false;
      }
    }
  }

  if (key == 'x') {
    if (millis() > 5999) {
      start = true;
    }
  }
}

void keyReleased() {
  if (key == 'w') {
    keys[0] = false;
  }

  if (key == 'a') {
    keys[1] = false;
  }

  if (key == 'd') {
    keys[2] = false;
  }
}
