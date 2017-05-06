/****************************************************\
 
 Install Gentoo
 (your main class - save as a new name!)
 
 // Last Updated 4/5/17
 
 \****************************************************/
ArrayList<GameObject> objects;
ArrayList<Star> stars;

void setup()
{
  fullScreen();
  gameSetup();
  loadImages();
  noCursor();
  objects = new ArrayList<GameObject>();
  stars = new ArrayList<Star>();
  objects.add(new Player(width/2, height - 200));
  // Spawning Enemies

  //for (int x = 0; x < 15; x++)
  //{
  //  objects.add(new b1(random(width), random(0, 100)));
  //}


  // ALIGN FROM TOP DOWN: IMAGE(X LENGTH) * 1.28 = OFFSET of | width/2+incrementer*OFFSET |
  for (int x = 0; x < 15; x++)
  {
    objects.add(new b1(width/2+x*100, 50));
  }


  //Stars!
  for (int n = 0; n < 300; n++) {
    stars.add(new Star(random(width), random(height), random(2, 4)));
  }
}

void draw()
{
  update();
  render();
  textSize(100);
  text(objects.get(0).curHealth, width-600, 100);
}

void update()
{
  act();
  collisions();
  cleanUp();
}

void collisions()
{
  for (GameObject one : objects)
  {
    for (GameObject two : objects)
    {
      if (one.isCollision(two))
      {
        one.addCollision(two);
        two.addCollision(one);
      }
    }
  }
}

void act()
{
  for (int x = 0; x < objects.size (); x++)
  {
    objects.get(x).act();
  }
}

void cleanUp()
{
  for (int x = 0; x < objects.size (); x++)
  {
    objects.get(x).cleanUp();
  }
}

void render()
{
  background(0);
  for (int n = 0; n < 300; n ++) {
    stars.get(n).act();
  }
  for (int x = 0; x < objects.size (); x++)
  {
    objects.get(x).render();
  }
}




/***** Malafarina Utility Methods *******\
 
 Supporting code to make processing work better for games
 - Key Press System that handles multiple rapid / concurrent presses better
 
 You do not need to modify or understand this code.
 
 \****************************************/

ArrayList<Character> keysPressed;

void gameSetup()
{
  keysPressed = new ArrayList<Character>();
}

public boolean getKey(char k)
{
  for (char c : keysPressed)
  {
    if (c == k)
    {
      return true;
    }
  }
  return false;
}

public void keyPressed()
{
  for (int x = 0; x < keysPressed.size (); x++)
  {
    if (keysPressed.get(x) == key)
    {
      return;
    }
  }
  keysPressed.add(key);
}

public void keyReleased()
{
  for (int x = 0; x < keysPressed.size (); x++)
  {
    if (keysPressed.get(x) == key)
    {
      keysPressed.remove(x);
    }
  }
}