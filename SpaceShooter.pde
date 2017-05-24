/****************************************************\
 Install Gentoo
 (your main class - save as a new name!)
 
 // Last Updated 4/5/17
 
 \****************************************************/
PFont font;
ArrayList<GameObject> objects;
ArrayList<Star> stars;
private String gamestate;
private int pauseTimer = PAUSE_DELAY;
private int credits = 100;
private int timer;
private float titleX = 0;
private float titleSpeed = 3;
Player p;
int level = 0;
int lives = PLAYER_LIVES;
void setup()
{
  fullScreen();
  gameSetup();
  loadImages();
  noCursor();
  objects = new ArrayList<GameObject>();
  stars = new ArrayList<Star>();
  //font = createFont("kenvector_future.ttf" ,48);
  font = createFont("kenvector_future.ttf", 48);
  textFont(font);
  p = new Player(width/2, height - 200);
  objects.add(p);
  gamestate = "title";
  /* ALIGN FROM TOP DOWN: IMAGE(X LENGTH) * 1.28 = OFFSET of | width/2+incrementer*OFFSET |
   for (int x = 0; x < 15; x++)
   {
   objects.add(new b1(width/2+x*100, 50));
   }
   */

  /* ALIGN FROM LEFT TO RIGHT: IMAGE(X LENGTH) 1.28 = OFFSET of | width/2+incrementer*OFFSET |
   for (int x = 0; x < 15; x++) {
   objects.add(new b1(50, height/2+x*100));
   }
   */

  //Stars!
  for (int n = 0; n < 300; n++) {
    stars.add(new Star(random(width), random(height), (int) random(2, 4)));
  }
}

void draw()
{
  timer++;
  if (pauseTimer > 0) {
    pauseTimer--;
  }

  if (gamestate.equals("gameplay")) {
    drawGamePlay();
  }
  if (gamestate.equals("pause")) {
    drawPause();
  }
  if (gamestate.equals("title")) {
    drawTitle();
    titleX+=titleSpeed;
    if (titleX > 330) {
      titleSpeed *= -1;
    }
    if (titleX < -330) {
      titleSpeed *= -1;
    }
  }
}

void update()
{
  act();
  collisions();
  cleanUp();
}

void collisions()
{
  for (GameObject one : objects)
  {
    for (GameObject two : objects)
    {
      if (one.isCollision(two))
      {
        one.addCollision(two);
        two.addCollision(one);
      }
    }
  }
}
void advanceLevel() {
  if (stageIsClear()) {
    level++;
    spawnEnemies();
  }
}

boolean stageIsClear() {
  for (GameObject o : objects) {
    if (o instanceof Enemy) {
      return false;
    }
  }
  return true;
}

void spawnEnemies() {
  if (level == 1) {
    spawnBasicBug(5);
  }
  if (level == 2) {
    spawnBasicVirus(3);
  }
  if (level == 3) {
    spawnb1(3);
  }
  if (level == 4) {
    spawnTerminator(3);
  }
  if (level == 5) {
    spawnUbuntu(4);
  }
  if (level == 6) {
  }
}

void spawnBasicVirus(int amount) {
  for (int x = 0; x < amount; x++)
  {
    objects.add(new BasicVirus(random(100, width-100), random(-500, -400)));
  }
}
void spawnBasicBug(int amount) {
  for (int x = 0; x < amount; x++)
  {
    objects.add(new BasicBug(random(100, width-100), random(-500, -400)));
  }
}
void spawnTerminator(int amount) {
  for (int x = 0; x < amount; x++)
  {
    objects.add(new Terminator(random(-100, 0), random(50, height-100)));
  }
}
void spawnb1(int amount) {
  for (int x = 0; x < amount; x++)
  {
    objects.add(new b1(random(100, width-100), random(-500, -400)));
  }
}
void spawnUbuntu(int amount) {
  for (int x = 0; x < amount; x++)
  {
    objects.add(new Ubuntu(random(100, width-100), random(-500, -400)));
  }
}

void act()
{
  for (int n = 0; n < stars.size(); n ++) {
    stars.get(n).act("DOWN");
  }

  for (int x = 0; x < objects.size (); x++)
  {
    objects.get(x).act();
  }
}

void cleanUp()
{
  for (int x = 0; x < objects.size (); x++)
  {
    objects.get(x).cleanUp();
  }
}

void render()
{
  background(0);
  for (int n = 0; n < stars.size(); n ++) {
    stars.get(n).render();
  }
  for (int x = 0; x < objects.size (); x++)
  {
    objects.get(x).render();
  }
  gui();
}

void gui() {
  textAlign(TOP, LEFT);
  //HEALTHBAR
  float drawWidth = (p.curHealth / p.maxHealth) * 200;
  stroke(120, 120, 120);
  fill(120, 0, 0, 100);
  rect(30, height-60, 200, 35, 8);
  fill(255, 0, 0, 100);
  rect(30, height-60, drawWidth, 35, 8);
  fill(255);
  textSize(15);
  text("Health: " + round(p.curHealth), 40, height-36);
  //LEFTHAND
  fill(35, 200, 170, 150);
  rect(10, 10, 80, 240);
  fill(255);
  textSize(15);
  fill(200, 0, 0);
  text("FPS: " + round(frameRate), 15, 40);
  fill(255);
  text("Lives: " + lives, 15, 60);
  text("C$: " + credits, 15, 80);
}

void drawGamePlay() {
  update();
  render();
  advanceLevel();
  if (getKey('p') && pauseTimer == 0) {
    gamestate = "pause";
    pauseTimer = PAUSE_DELAY;
  }
}

void drawTitle() {

  background(0);
  image(backgroundflare, titleX, 0);
  //background(80, 160, 120);
  for (int n = 0; n < stars.size(); n++) {
    stars.get(n).render();
  }
  for (int n = 0; n < stars.size(); n++) {
    stars.get(n).act("DIAGONAL");
  }
  image(title, titleX, 0);
  textSize(50);
  textAlign(CENTER, CENTER);
  if (timer % 100 < 60) {
    text("Press Space to Play!", width/2, height-50);
  }
  fill(255, 0, 0);
  text("Linux: The Game", width/2, 50);
  if (getKey(' ')) {
    gamestate = "gameplay";
  }
}

void drawPause() {
  render();
  noStroke();
  fill(128, 128, 128, 100);
  rect(0, 0, width, height);
  if (!p.flamethrower) {
    fill(255);
    textSize(20);
    text("1.) Flamethrower: $30", 30, 300);
  } else {
    fill(120);
    textSize(20);
    text("1.) Flamethrower: PURCHASED", 30, 300);
  }
  if (!p.octoshot) {
    fill(255);
    textSize(20);
    text("2.) Octoshot: $40", 30, 330);
  } else {
    fill(120);
    textSize(20);
    text("2.) Octoshot: PURCHASED", 30, 330);
  }

  if (getKey('p') && pauseTimer == 0) {
    gamestate = "gameplay";
    pauseTimer = PAUSE_DELAY;
  }
  if (getKey('1')) {
    if (credits >= FLAMETHROWER_COST && !p.flamethrower) {
      buyFlamethrower();
      credits-=FLAMETHROWER_COST;
    }
  }
  if (getKey('2')) {
    if (credits >= OCTOSHOT_COST && !p.octoshot) {
      buyOctoshot();
      credits-=OCTOSHOT_COST;
    }
  }
}

void buyFlamethrower() {
  p.flamethrower = true;
}
void buyOctoshot() {
  p.octoshot = true;
}




/***** Malafarina Utility Methods *******\
 
 Supporting code to make processing work better for games
 - Key Press System that handles multiple rapid / concurrent presses better
 
 You do not need to modify or understand this code.
 
 \****************************************/

ArrayList<Character> keysPressed;

void gameSetup()
{
  keysPressed = new ArrayList<Character>();
}

public boolean getKey(char k)
{
  for (char c : keysPressed)
  {
    if (c == k)
    {
      return true;
    }
  }
  return false;
}

public void keyPressed()
{
  for (int x = 0; x < keysPressed.size (); x++)
  {
    if (keysPressed.get(x) == key)
    {
      return;
    }
  }
  keysPressed.add(key);
}

public void keyReleased()
{
  for (int x = 0; x < keysPressed.size (); x++)
  {
    if (keysPressed.get(x) == key)
    {
      keysPressed.remove(x);
    }
  }
}