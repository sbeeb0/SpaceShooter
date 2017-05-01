/****************************************************\
 
 Evil Square
 (a subclass of Enemy)
 
 \****************************************************/


class EvilSquare extends Enemy
{
  private int ranShotMin;
  private int ranShotMax;
  private int ranShot;
  private int maxShot;
  EvilSquare(float x, float y)
  {   
    super(x, y, redSquare.width, redSquare.height);
    xSpeed = EVIL_SQUARE_X_SPEED;
    ySpeed = EVIL_SQUARE_Y_SPEED;
    ranShotMin = 50;
    ranShotMax = 100;
    ranShot = (int) random(ranShotMin, ranShotMax);
    maxShot = ranShot;
    image = redSquare;
  }

  public void act()
  {
    super.act();

    // This code causes the enemy to wrap when it goes to the bottom of the screen
    if (y > height) 
    {
      y = -image.height;
    }
    // ranShot countdown
    if (ranShot > 0) {
      ranShot--;
    }
    // This enemy does not know how to shoot - fix that!
    if (ranShot == 0) {
      objects.add(new RedShot(x+redSquare.width/2, y+10));
      ranShot = maxShot;
    }
  }
}