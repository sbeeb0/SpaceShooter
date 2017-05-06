/****************************************************\
 
 Utility
 (A place to store constants and load images)
 
 \****************************************************/

PImage linuxTux;
PImage blueShot;
PImage redSquare;
PImage redShot;
PImage glasses;
PImage defaultImage;
PImage basicBug;
PImage basicVirus1;
PImage basicVirus2;
PImage b1;


// Player constants
final static int   PLAYER_COOLDOWN = 10;
final static float PLAYER_SPEED = 6;
final static float PLAYER_SHOT_SPEED = 8;
final static float PLAYER_SHOT_DAMAGE = 15;
final static int   PLAYER_SHOT_COOLDOWN = 15;
final static int   PLAYER_BASE_HP = 100;

// Red Shot Constants
final static float RED_SHOT_SPEED = 10;
final static float RED_SHOT_DAMAGE = 10;
final static float GLASSES_SPEED = 10;
final static float GLASSES_DAMAGE = 30;

// BasicBug Constants
final static int   BASIC_BUG_SHOT_COOLDOWN = 70;
final static int   BASIC_BUG_HP = 10;
final static float BASIC_BUG_X_SPEED = 1;
final static float BASIC_BUG_Y_SPEED = 3;

// BasicVirus Constants
final static int   BASIC_VIRUS_SHOT_COOLDOWN = 70;
final static int   BASIC_VIRUS_HP = 10;
final static float BASIC_VIRUS_X_SPEED = 1;
final static float BASIC_VIRUS_Y_SPEED = 3;

// b1 Constants
final static int   B1_SHOT_COOLDOWN = 70;
final static int   B1_HP = 10;
final static float B1_X_SPEED = 1;
final static float B1_Y_SPEED = 3;

public void loadImages()
{
  linuxTux = loadImage("linuxTux.png");
  blueShot = loadImage("blue_shot.png");
  redSquare = loadImage("red_square.png");
  basicBug = loadImage("basicBug.png");
  redShot = loadImage("red_shot.png");
  defaultImage = loadImage("default_image.png");
  basicVirus1 = loadImage("basicVirus1.png");
  b1 = loadImage("b1.png");
  glasses = loadImage("glasses2.png");
  b1.resize(128, 128);
  glasses.resize(64, 15);
}