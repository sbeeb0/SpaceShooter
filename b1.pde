/****************************************************\
 
 b1
 (a subclass of Enemy)
 
 \****************************************************/
class b1 extends Enemy
{
  private float init_xSpeed;
  b1(float x, float y)
  {   
    super(x, y, b1.width, b1.height);
    init_xSpeed = random(-3, 4);
    damage = 20;
    xSpeed = init_xSpeed;
    ySpeed = B1_Y_SPEED;
    image = b1;
    curHealth = 128;
    maxHealth = 128;
    shotTimer = (int) random(1, 100);
  }
  //act
  public void act()
  {
    super.act();
    if (init_xSpeed == 0) {
      init_xSpeed = random(-3, 4);
    }
    if (y > height) 
    {
      y = -image.height;
    }
    if (x + image.width > width) {
      xSpeed *= -1;
    }
    if (x < 0) {
      xSpeed *= -1;
    }
    if (shotTimer % B1_SHOT_COOLDOWN == 0) {
      objects.add(new glassesProj(x+b1.width/2, y+b1.height/2));
      shotTimer = 0;
    }
    if (shotTimer % 180 == 0) {
      xSpeed *= -1;
    }
  }
}