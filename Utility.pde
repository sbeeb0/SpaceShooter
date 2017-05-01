/****************************************************\

                     Utility
    (A place to store constants and load images)

\****************************************************/

PImage blueTriangle;
PImage blueShot;
PImage redSquare;
PImage redShot;
PImage defaultImage;

// Player constants
final static int   PLAYER_COOLDOWN = 10;
final static float PLAYER_SPEED = 6;
final static float PLAYER_SHOT_SPEED = 8;
final static float PLAYER_SHOT_DAMAGE = 3;

// Evil Square and Red Shot Constants
final static float RED_SHOT_SPEED = 7;
final static float RED_SHOT_DAMAGE = 1;
final static int   EVIL_SQUARE_COOLDOWN = 60;
final static float EVIL_SQUARE_X_SPEED = 0;
final static float EVIL_SQUARE_Y_SPEED = 4;


public void loadImages()
{
  blueTriangle = loadImage("blue_triangle.png");
  blueShot = loadImage("blue_shot.png");
  redSquare = loadImage("red_square.png");
  redShot = loadImage("red_shot.png");
  defaultImage = loadImage("default_image.png");
}