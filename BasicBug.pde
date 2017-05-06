/****************************************************\
 
 basicBug
 (a subclass of Enemy)
 
 \****************************************************/


class BasicBug extends Enemy
{
  private float init_xSpeed;
  BasicBug(float x, float y)
  {   
    super(x, y, basicBug.width, basicBug.height);
    init_xSpeed = random(-3, 4);
    damage = 10;
    xSpeed = init_xSpeed;
    ySpeed = BASIC_BUG_Y_SPEED;
    image = basicBug;
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
    if (shotTimer % BASIC_BUG_SHOT_COOLDOWN == 0) {
      objects.add(new RedShot(x+basicBug.width/2, y+basicBug.height/2));
      shotTimer = 0;
      xSpeed  = -xSpeed;
    }
  }
}