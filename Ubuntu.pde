/****************************************************\
 
 UBUNTU
 (a subclass of Enemy)
 
 \****************************************************/
class Ubuntu extends Enemy
{
  private int ranImage;
  Ubuntu(float x, float y)
  {   
    super(x, y, ubuntu1.width, ubuntu1.height);
    ranImage = (int) random(1, 5);
    damage = 400;
    xSpeed = UBUNTU_X_SPEED;
    ySpeed = UBUNTU_Y_SPEED;
    image = ubuntu1;
    curHealth = 320;
    maxHealth = 320;
    shotTimer = (int) random(1, 100);
  }
  //act
  public void act()
  {
    super.act();
    if (ranImage > 4) {
      ranImage = 1;
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
    if (shotTimer % UBUNTU_SHOT_COOLDOWN == 0) {
      objects.add(new omniShot(x+image.width/2, y+image.height/2, OMNI_SHOT_SPEED + UBUNTU_X_SPEED, 0));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, -OMNI_SHOT_SPEED - UBUNTU_X_SPEED, 0));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, 0, OMNI_SHOT_SPEED + UBUNTU_Y_SPEED));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, 0, -OMNI_SHOT_SPEED - UBUNTU_Y_SPEED));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, OMNI_SHOT_SPEED/2 + UBUNTU_X_SPEED, OMNI_SHOT_SPEED/2 + UBUNTU_Y_SPEED));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, -OMNI_SHOT_SPEED/2 - UBUNTU_X_SPEED, -OMNI_SHOT_SPEED/2 - UBUNTU_Y_SPEED));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, -OMNI_SHOT_SPEED/2 - UBUNTU_X_SPEED, OMNI_SHOT_SPEED/2 + UBUNTU_Y_SPEED));
      objects.add(new omniShot(x+image.width/2, y+image.height/2, OMNI_SHOT_SPEED/2 + UBUNTU_X_SPEED, -OMNI_SHOT_SPEED/2 - UBUNTU_Y_SPEED));
      shotTimer = 0;
    }
    if (ranImage == 1) {
      image = ubuntu1;
    } else if (ranImage == 2) {
      image = ubuntu2;
    } else if (ranImage == 3) {
      image = ubuntu3;
    } else if (ranImage == 4) {
      image = ubuntu4;
    }

    if (timer % 30 == 0) {
      ranImage++;
    }
  }
}