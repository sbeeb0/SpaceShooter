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
PImage ubuntu1;
PImage ubuntu2;
PImage ubuntu3;
PImage ubuntu4;
PImage omniShot;
PImage boom;
PImage terminator;
PImage title;
PImage backgroundflare;

// Player constants
final static int   PLAYER_COOLDOWN = 10;
final static float PLAYER_SPEED = 6;
final static float PLAYER_SHOT_SPEED = 8;
final static float PLAYER_SHOT_DAMAGE = 15;
final static int   PLAYER_SHOT_COOLDOWN = 15;
final static int   PLAYER_BASE_HP = 100;
final static int   PLAYER_LIVES = 5;
final static int   PLAYER_INVULNERABILITY_DURATION = 180;
final static int   PAUSE_DELAY = 40;
final static int   MAX_LEVEL = 20;

// Upgrade Constants
final static int   FLAMETHROWER_COST = 30;
final static int   OCTOSHOT_COST = 40;


// Projectile Constants
final static float RED_SHOT_SPEED = 10;
final static float RED_SHOT_DAMAGE = 10;
final static float GLASSES_SPEED = 7;
final static float GLASSES_DAMAGE = 30;
final static float OMNI_SHOT_SPEED = 8;
final static float OMNI_SHOT_DAMAGE = 45;
final static float TERMINATOR_SHOT_SPEED = 8;
final static float TERMINATOR_SHOT_DAMAGE = 50;
final static float LASER_SHOT_DAMAGE = 30;

// BasicBug Constants
final static int   BASIC_BUG_SHOT_COOLDOWN = 70;
final static int   BASIC_BUG_HP = 10;
final static float BASIC_BUG_X_SPEED = 1;
final static float BASIC_BUG_Y_SPEED = 3;

// BasicVirus Constants
final static int   BASIC_VIRUS_SHOT_COOLDOWN =140;
final static int   BASIC_VIRUS_HP = 10;
final static float BASIC_VIRUS_X_SPEED = 1;
final static float BASIC_VIRUS_Y_SPEED = 3;

// b1 Constants
final static int   B1_SHOT_COOLDOWN = 140;
final static int   B1_HP = 5;
final static float B1_X_SPEED = 3;
final static float B1_Y_SPEED = 1;

// Ubuntu Constants
final static int   UBUNTU_SHOT_COOLDOWN = 140;
final static int   UBUNTU_HP = 5;
final static float UBUNTU_X_SPEED = 1;
final static float UBUNTU_Y_SPEED = 1;

// Terminator Constants
final static int   TERMINATOR_SHOT_COOLDOWN = 140;
final static int   TERMINATOR_HP = 5;
final static float TERMINATOR_X_SPEED = 1;
final static float TERMINATOR_Y_SPEED = 0;

// Ubuntu Constants
final static int   BOSS_SHOT_COOLDOWN = 140;
final static int   BOSS_HP = 100;
final static float BOSS_X_SPEED = 1;
final static float BOSS_Y_SPEED = 1;


public void loadImages()
{
  linuxTux = loadImage("linuxTux3.png");
  blueShot = loadImage("blue_shot.png");
  redSquare = loadImage("red_square.png");
  basicBug = loadImage("basicBug.png");
  redShot = loadImage("red_shot.png");
  defaultImage = loadImage("default_image.png");
  basicVirus1 = loadImage("basicVirus1.png");
  ubuntu1 = loadImage("ubuntu1.png");
  ubuntu2 = loadImage("ubuntu2.png");
  ubuntu3 = loadImage("ubuntu3.png");
  ubuntu4 = loadImage("ubuntu4.png");
  omniShot = loadImage("omniShot.png");
  terminator = loadImage("terminalator.png");
  b1 = loadImage("b1.png");
  glasses = loadImage("glasses2.png");
  title = loadImage("richy.png");
  backgroundflare = loadImage("backgroundflare1.png");
  boom = loadImage("boom.png");
}