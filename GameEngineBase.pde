/****************************************************\
 
                    GameEngineBase
           (your main class - save as a new name!)
           
           // Last Updated 4/5/17
 
\****************************************************/

ArrayList<GameObject> objects;

void setup()
{
   fullScreen();
   gameSetup();
   loadImages();
   noCursor();

   objects = new ArrayList<GameObject>();

   objects.add(new Player(width/2, height - 200));

   for (int x = 0; x < 15; x++)
   {
      objects.add(new EvilSquare(random(width), random(0, 100)));
   }
}

void draw()
{
   update();
   render();
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