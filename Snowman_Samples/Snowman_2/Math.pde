void camCalculate() {
  x1 = (sin(rad(heading)) * 100);
  xLoc = snowX - x1;

  z1 = (cos(rad(heading)) * 100);
  zLoc = snowZ - z1;
}

void snowmamCalculate() {
  x = sin(rad(heading));
  snowX = snowX + x;

  z = cos(rad(heading));
  snowZ = snowZ + z;
}

float rad(float input) {
  return input * 3.1415/180;
}

void enemyLoc(int a) {
  rand = random(0, 359);
  enemyX[a] = (sin(rad(rand)) * 500);
  enemyY[a] = (cos(rad(rand)) * 500);
}

void enemyDirec() {  //works
  for (int i = 0; i <= 8; i++) {
    eneDirec[i] = atan2((enemyY[i] - snowZ), (enemyX[i] - snowX));
  }
}

void enemyTranslate(int a) { //works
  xEne = (sin(-eneDirec[a] - rad(90)));
  enemyX[a] = enemyX[a] + xEne;

  yEne = (cos(-eneDirec[a] - rad(90)));
  enemyY[a] = enemyY[a] + yEne;
}

void enemyLocation(int a) {
  translate(enemyX[a], 0, enemyY[a]);
}

void bulletMove() {
  bulletX += sin(rad(bulletDirec));
  bulletY += cos(rad(bulletDirec));
}

float calcDist(int a) {
  return sqrt((enemyY[a] - bulletY) * (enemyY[a] - bulletY) + (enemyX[a] - bulletX) * (enemyX[a] - bulletX));
}
