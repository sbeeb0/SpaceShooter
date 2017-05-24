/****************************************************\
 
 basicVirus
 (a subclass of Enemy)
 
 \****************************************************/
class BasicVirus extends Enemy
{
  private PVector location;
  BasicVirus(float x, float y)
  {   
    super(x, y, basicVirus1.width, basicVirus1.height);
    damage = 20;
    xSpeed = BASIC_VIRUS_X_SPEED;
    ySpeed = BASIC_VIRUS_Y_SPEED;
    location = new PVector(x, y, 0);
    image = basicVirus1;
    curHealth = 60;
    maxHealth = 60;
    shotTimer = (int) random(0, 100);
  }
  //act
  public void act()
  {
    super.act();
    if (y > height) 
    {
      y = -image.height;
    }
    float angle = atan2(p.y-location.y, p.x-location.x);
    float newX = cos(angle)*(ySpeed/xSpeed)+location.x;
    float newY = sin(angle)*(ySpeed/xSpeed)+location.y;

    location.set(newX, newY, 0);
    x = newX;
    y = newY;

    if (shotTimer % BASIC_VIRUS_SHOT_COOLDOWN == 0) {
      objects.add(new laserShot(x+basicVirus1.width/2, y+basicVirus1.height/2));
      shotTimer = 0;
    }
  }
  void die() {
    super.die();
    objects.add(new Boom(x, y, w*0.75));
  }
}