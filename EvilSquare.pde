/****************************************************\
 
 Evil Square
 (a subclass of Enemy)
 
 \****************************************************/


class EvilSquare extends Enemy
{
  private float init_xSpeed;
  EvilSquare(float x, float y)
  {   
    super(x, y, redSquare.width, redSquare.height);
    init_xSpeed = random(-3, 4);
    xSpeed = init_xSpeed;
    ySpeed = EVIL_SQUARE_Y_SPEED;
    image = redSquare;
    curHealth = 10;
    maxHealth = 10;
    shotTimer = (int) random(0, 100);
  }
  //act
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
    // quick fix for 0 integers
    if (init_xSpeed == 0) {
      xSpeed = random(-3, 4);
    }
    if (shotTimer % EVIL_SQUARE_SHOT_COOLDOWN == 0) {
      objects.add(new RedShot(x+redSquare.width/2, y+10));
      shotTimer = 0;
      xSpeed  = -xSpeed;
    }
  }
}