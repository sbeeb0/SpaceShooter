/****************************************************\
 
 terminator
 (a subclass of Enemy)
 
 \****************************************************/


class Terminator extends Enemy
{
  Terminator(float x, float y)
  {   
    super(x, y, terminator.width, terminator.height);
    damage = 10;
    xSpeed = TERMINATOR_X_SPEED;
    ySpeed = TERMINATOR_Y_SPEED;
    image = terminator;
    curHealth = 10;
    maxHealth = 10;
    shotTimer = (int) random(0, 100);
  }
  //act
  public void act()
  {
    super.act();
    // This code causes the enemy to wrap when it goes to the bottom of the screen
    if (y > height) 
    {
      y = -image.height;
    }
    if (x > width) {
      x = -image.width;
    }
    // quick fix for 0 integers
    if (shotTimer % TERMINATOR_SHOT_COOLDOWN == 0) {
      objects.add(new TerminatorShot(x+terminator.width/2, y+terminator.height/2, TERMINATOR_SHOT_SPEED));
      shotTimer = 0;
    }
  }
  void die() {
    super.die();
    ambience.add(new Boom(x, y, w*0.75));
  }
}