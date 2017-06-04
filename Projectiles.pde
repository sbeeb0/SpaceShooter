/****************************************************\
 
 Abstract Projectile Classes
 (Subclasses of GameObject)
 
 \****************************************************/

abstract class Projectile extends GameObject
{
  int duration;
  Projectile(float x, float y, float w, float h, float xSpeed, float ySpeed)
  {
    super(x, y, w, h);
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    duration = 50;
  }

  void act() {
    super.act();
    if (timer > duration) {
      die();
    }
  }
}

abstract class PlayerProjectile extends Projectile
{
  PlayerProjectile(float x, float y, float w, float h, float xSpeed, float ySpeed)
  {
    super(x, y, w, h, xSpeed, ySpeed);
  }

  void reactions()
  {
    for (int x = 0; x < collisions.size (); x++)
    {
      GameObject o = collisions.get(x);

      // When this projectile hits an enemy, set it to be removed
      if (o instanceof Enemy)
      {
        die();
      }
    }
  }
}

abstract class EnemyProjectile extends Projectile
{
  EnemyProjectile(float x, float y, float w, float h, float xSpeed, float ySpeed)
  {
    super(x, y, w, h, xSpeed, ySpeed);
  }

  void reactions()
  {
    for (int x = 0; x < collisions.size (); x++)
    {
      GameObject o = collisions.get(x);

      // When this projectile hits a player, set it to be removed
      if (o instanceof Player)
      {
        die();
      }
    }
  }
}

/****************************************************\
 
 Concrete Projectile Classes
 
 - You'll design new projectiles here.
 - The most important part is the "super" call
 - It takes six parameters, in this order
 1) starting x position
 2) starting y position
 3) width
 4) height
 5) x speed
 6) y speed
 
 \****************************************************/

class PlayerShotBasic extends PlayerProjectile
{
  PlayerShotBasic(float x, float y)
  {
    super(x, y, blueShot.width, blueShot.height, 0, -PLAYER_SHOT_SPEED);
    duration = 400;
    image = blueShot;
    damage = PLAYER_SHOT_DAMAGE;
  }
}

class heatShot extends PlayerProjectile
{
  private PVector location;
  heatShot(float x, float y)
  {
    super(x, y, blueShot.width, blueShot.height, 3, -5);
    location = new PVector(x, y, 0);
    duration = 400;
    image = blueShot;
    damage = 0;
  }
  void act() {
    super.act();
    for (GameObject o : objects) {
      if (o instanceof Enemy) {
        if (dist(p.x, p.y, o.x, o.y) <= 300) {
          float angle = atan2(o.y-location.y, o.x-location.x);
          float newX = cos(angle)*(ySpeed/xSpeed)+location.x;  
          float newY = sin(angle)*(ySpeed/xSpeed)+location.y;
          if (xSpeed <= 0) {
            xSpeed *= -1;
          }
          if (ySpeed <= 0) {
            ySpeed *= -1;
          }
          x = newX;
          y = newY;
          location.set(x, y, 0);
          println("ENEMY POS: (" + round(o.x) + ", " + round(o.y) + ")");
          println("TARGET POS: (" + round(newX) + ", " + round(newY) + ")");
        }
      }
    }
  }
}

class flameShot extends PlayerProjectile
{
  flameShot(float x, float y)
  {
    super(x, y, blueShot.width, blueShot.height, random(-1, 1), -random(3, 6));
    duration = 30;
    image = blueShot;
    damage = 1;
  }
}

class octoShot extends PlayerProjectile
{
  octoShot(float x, float y, float xSpeed, float ySpeed)
  {
    super(x, y, blueShot.width, blueShot.height, xSpeed, ySpeed);
    duration = 30;
    image = blueShot;
    damage = PLAYER_SHOT_DAMAGE;
  }
}

//////////////////////////////ENEMY PROJECTILES //////////////////////////

class RedShot extends EnemyProjectile
{
  RedShot(float x, float y)
  {
    super(x, y, redShot.width, redShot.height, 0, RED_SHOT_SPEED);
    duration = 400;
    image = redShot;
    damage = RED_SHOT_DAMAGE;
  }
}

class laserShot extends EnemyProjectile
{
  private PVector location;
  laserShot(float x, float y)
  {
    super(x, y, redShot.width, redShot.height, 1, 5);
    location = new PVector(x, y, 0);
    duration = 400;
    image = redShot;
    damage = RED_SHOT_DAMAGE;
  }
  void act() {
    super.act();
    float angle = atan2(p.y-location.y, p.x-location.x);
    float newX = cos(angle)*(ySpeed/xSpeed)+location.x;
    float newY = sin(angle)*(ySpeed/xSpeed)+location.y;
    x = newX;
    y = newY;
    location.set(x, y, 0);
    //h++;
  }
}

class omniShot extends EnemyProjectile
{
  omniShot(float x, float y, float xSpeed, float ySpeed)
  {
    super(x, y, omniShot.width, omniShot.height, xSpeed, ySpeed);
    duration = 100;
    image = omniShot;
    damage = OMNI_SHOT_DAMAGE;
  }
}

class TerminatorShot extends EnemyProjectile
{
  float newY;
  TerminatorShot(float x, float y, float speed)
  {
    super(x, y, redShot.width, redShot.height, speed, 0);
    duration = 420;
    image = redShot;
    damage = TERMINATOR_SHOT_DAMAGE;
  }
  void act() {
    super.act();
    if (timer % 120 > 0) {
      newY = sin(x*70) + y;
      y = newY;
    }
  }
}


class glassesProj extends EnemyProjectile
{
  glassesProj(float x, float y)
  {
    super(x, y, glasses.width, glasses.height, GLASSES_SPEED/2, GLASSES_SPEED);
    duration = 400;
    image = glasses;
    damage = GLASSES_DAMAGE;
  }
  void act() {
    super.act();
    if (timer % 10 == 0) {
      xSpeed *= -1;
    }
  }
}