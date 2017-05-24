/****************************************************\
 
 Player 
 (a subclass of GameObject)
 
 \****************************************************/
class Player extends GameObject
{
  private int invulnerabilityTimer;
  private boolean flamethrower = false;
  private boolean octoshot = false;
  Player(float x, float y)
  {   
    super(x, y, linuxTux.width, linuxTux.height);
    image = linuxTux;
    curHealth = PLAYER_BASE_HP;
    maxHealth = PLAYER_BASE_HP;
    invulnerabilityTimer = 0;
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
    if (getKey('j') && !getKey(' ') && !getKey('k')) {
      if (flamethrower) {
        objects.add(new flameShot(x+w/2, y));
        objects.add(new flameShot(x+w/2, y));
        objects.add(new flameShot(x+w/2, y));
      }
    }
    if (getKey('u') && shotTimer % PLAYER_SHOT_COOLDOWN == 0) {
      objects.add(new heatShot(x+w/2, y));
      objects.add(new heatShot(x+w/2, y));
      objects.add(new heatShot(x+w/2, y));
      shotTimer = 0;
    }
    if (getKey('k') && !getKey(' ') && !getKey('j')) {
      if (octoshot && shotTimer % PLAYER_SHOT_COOLDOWN == 0) {
        objects.add(new octoShot(x+image.width/2, y+image.height/2, OMNI_SHOT_SPEED + PLAYER_SPEED, 0));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, -OMNI_SHOT_SPEED - PLAYER_SPEED, 0));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, 0, OMNI_SHOT_SPEED + PLAYER_SPEED));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, 0, -OMNI_SHOT_SPEED - PLAYER_SPEED));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, OMNI_SHOT_SPEED/2 + PLAYER_SPEED, OMNI_SHOT_SPEED/2 + PLAYER_SPEED));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, -OMNI_SHOT_SPEED/2 - PLAYER_SPEED, -OMNI_SHOT_SPEED/2 - PLAYER_SPEED));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, -OMNI_SHOT_SPEED/2 - PLAYER_SPEED, OMNI_SHOT_SPEED/2 + PLAYER_SPEED));
        objects.add(new octoShot(x+image.width/2, y+image.height/2, OMNI_SHOT_SPEED/2 + PLAYER_SPEED, -OMNI_SHOT_SPEED/2 - PLAYER_SPEED));
      }
    }
    if (invulnerabilityTimer > 0) {
      invulnerabilityTimer--;
    } else {
      invulnerable = false;
    }
    if (invulnerable) {
      if (timer % 2 == 0) {
        image = linuxTux;
      } else {
        image = ubuntu3;
      }
    }
    if (invulnerabilityTimer <= 0) {
      image = linuxTux;
    }
  }

  public void reactions()
  {
    for (int x = 0; x < collisions.size (); x++)
    {
      GameObject o = collisions.get(x);

      if (!invulnerable && o.isAlive && (o instanceof EnemyProjectile || o instanceof Enemy))
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
    if (x > width - w) {
      x = width-w;
    }
    if (x < 0) {
      x = 0;
    }
    if (y > height - h) {
      y = height - h;
    }
    if (y < 0) {
      y = 0;
    }
  }
  void die() {
    if (lives <= 0) {
      curHealth = 0;
      isAlive = false;
      for (GameObject o : objects) {
        if (o instanceof Enemy) {
          o.die();
        }
      }
    } else {
      curHealth = maxHealth;
      lives--;
      x = width/2;
      y = height-200;
    }
    if (lives > 0) {
      invulnerabilityTimer = PLAYER_INVULNERABILITY_DURATION;
      invulnerable = true;
    }
  }
}