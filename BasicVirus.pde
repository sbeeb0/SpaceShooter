/****************************************************\
 
 basicVirus
 (a subclass of Enemy)
 
 \****************************************************/
class BasicVirus extends Enemy
{
  private int imageSwapper;
  private float init_xSpeed;
  BasicVirus(float x, float y)
  {   
    super(x, y, basicVirus1.width, basicVirus1.height);
    init_xSpeed = random(-3, 4);
    damage = 10;
    xSpeed = init_xSpeed;
    ySpeed = BASIC_VIRUS_Y_SPEED;
    imageSwapper = (int) random(1, 3);
    curHealth = 10;
    maxHealth = 10;
    shotTimer = (int) random(0, 100);
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
    // Pick Images of basicVirus
    if (imageSwapper == 1) {
      image = basicVirus1;
    } else if (imageSwapper == 2) {
      image = basicVirus1;
    }
    println(imageSwapper);
    // This code causes the enemy to wrap when it goes to the bottom of the screen
    if (y > height) 
    {
      y = -image.height;
    }
    // quick fix for 0 integers
    if (init_xSpeed == 0) {
      xSpeed = random(-3, 4);
    }
    if (shotTimer % BASIC_VIRUS_SHOT_COOLDOWN == 0) {
      objects.add(new RedShot(x+basicVirus1.width/2, y+10));
      shotTimer = 0;
      xSpeed  = -xSpeed;
    }
  }
}