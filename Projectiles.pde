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
  TerminatorShot(float x, float y, float speed)
  {
    super(x, y, redShot.width, redShot.height, speed, 0);
    duration = 200;
    image = redShot;
    damage = TERMINATOR_SHOT_DAMAGE;
  }
  void act() {
    super.act();
    if (timer % 15 == 0) {
      w+= 10;
      h+= 10;
    } else {
      w--;
      h--;
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