/****************************************************\
 
 basicBug
 (a subclass of Enemy)
 
 \****************************************************/


class Boss extends Enemy
{
  Boss(float x, float y)
  {   
    super(x, y, basicBug.width, basicBug.height);
    damage = 99999;
    xSpeed = BOSS_X_SPEED;
    ySpeed = BOSS_Y_SPEED;
    image = basicBug;
    curHealth = BOSS_HP;
    maxHealth = curHealth;
    shotTimer = (int) random(0, 100);
  }
  //act
  public void act()
  {
    super.act();
    if (curHealth <= 0) {
      die();
    }
    // This code causes the enemy to wrap when it goes to the bottom of the screen
    if (y > height) 
    {
      y = -image.height;
    }
    if (shotTimer % BOSS_SHOT_COOLDOWN == 0) {
      objects.add(new RedShot(x+basicBug.width/2, y+basicBug.height/2));
      shotTimer = 0;
      xSpeed  = -xSpeed;
    }
  }
  void die() {
    super.die();
    ambience.add(new Boom(x, y, w*0.75));
  }
}