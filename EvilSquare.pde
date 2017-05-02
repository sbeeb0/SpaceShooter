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
  private float init_xSpeed;
  EvilSquare(float x, float y)
  {   
    super(x, y, redSquare.width, redSquare.height);
    init_xSpeed = random(-3, 4);
    xSpeed = init_xSpeed;
    ySpeed = EVIL_SQUARE_Y_SPEED;
    ranShotMin = 50;
    ranShotMax = 100;
    ranShot = (int) random(ranShotMin, ranShotMax);
    maxShot = ranShot;
    image = redSquare;
    curHealth = 10;
    maxHealth = 10;
  }

  public void act()
  {
    super.act();
    //move constantly
    if (timer % 2 != 0) {
      x--;
    } else if (timer % 2 == 0) {
      x++;
    }
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
      //Shoot
      objects.add(new RedShot(x+redSquare.width/2, y+10));
      //Reset Shot Cooldown
      ranShot = maxShot;
      //Change direction after each shot
      xSpeed  = -xSpeed;
    }
  }
}