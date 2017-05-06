/****************************************************\
 
 b1
 (a subclass of Enemy)
 
 \****************************************************/
class b1 extends Enemy
{
  b1(float x, float y)
  {   
    super(x, y, b1.width, b1.height);
    damage = 20;
    xSpeed = B1_X_SPEED;
    ySpeed = B1_Y_SPEED;
    image = b1;
    curHealth = 128;
    maxHealth = 128;
    shotTimer = (int) random(0, 100);
    ;
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
    if (y > height) 
    {
      y = -image.height;
    }
    if (shotTimer % B1_SHOT_COOLDOWN == 0) {
      objects.add(new glassesProj(x+b1.width/2, y+b1.height/2));
      shotTimer = 0;
    }
    if (timer % 180 == 0) {
      xSpeed *= -1;
    }
  }
}