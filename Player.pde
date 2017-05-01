/****************************************************\
 
 Player 
 (a subclass of GameObject)
 
 \****************************************************/

class Player extends GameObject
{
  Player(float x, float y)
  {   
    super(x, y, blueTriangle.width, blueTriangle.height);
    image = blueTriangle;
  }

  public void act()
  {
    super.act();

    xSpeed = 0;
    ySpeed = 0;

    movement();
    collisions();
    // Pressing space bar allows you to fire... but it goes every frame!
    // Add a timer using the constant "PLAYER_COOLDOWN" provided in utility
    if (getKey(' '))
    {
      if (timer % 15 == 0) {
        objects.add(new PlayerShotBasic(x, y));  
        objects.add(new PlayerShotBasic(x+24, y));
      }
    }
  }

  public void reactions()
  {
    for (int x = 0; x < collisions.size (); x++)
    {
      GameObject o = collisions.get(x);

      if (o instanceof EnemyProjectile || o instanceof Enemy)
      {
        takeDamage(o.getDamage());
      }
    }
  }
  void movement() {
    if (getKey('a'))
    {
      xSpeed -= PLAYER_SPEED;
    }
    if (getKey('d'))
    {
      xSpeed += PLAYER_SPEED;
    }   
    if (getKey('w'))
    {
      ySpeed -= PLAYER_SPEED;
    }   
    if (getKey('s'))
    {
      ySpeed += PLAYER_SPEED;
    }
  }
  void collisions() {
    if (x > width - blueTriangle.width) {
      x = width-blueTriangle.width;
    }
    if (x < 0) {
      x = 0;
    }
    if (y > height - blueTriangle.height) {
      y = height - blueTriangle.height;
    }
    if (y < 0) {
      y = 0;
    }
  }
}