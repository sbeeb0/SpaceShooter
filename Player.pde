/****************************************************\
 
 Player 
 (a subclass of GameObject)
 
 \****************************************************/

class Player extends GameObject
{
  Player(float x, float y)
  {   
    super(x, y, linuxTux.width, linuxTux.height);
    image = linuxTux;
    curHealth = PLAYER_BASE_HP;
    maxHealth = PLAYER_BASE_HP;
  }

  public void act()
  {
    super.act();
    xSpeed = 0;
    ySpeed = 0;

    shotTimer++;
    movement();
    collisions();

    if (getKey(' '))
    {
      if (shotTimer % PLAYER_SHOT_COOLDOWN == 0) {
        objects.add(new PlayerShotBasic(x, y));  
        objects.add(new PlayerShotBasic(x+24, y));
        shotTimer = 0;
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
    if (x > width - linuxTux.width) {
      x = width-linuxTux.width;
    }
    if (x < 0) {
      x = 0;
    }
    if (y > height - linuxTux.height) {
      y = height - linuxTux.height;
    }
    if (y < 0) {
      y = 0;
    }
  }
}