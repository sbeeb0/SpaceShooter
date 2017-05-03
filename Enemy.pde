/****************************************************\
 
 Enemy
 (a subclass of GameObject)
 
 \****************************************************/

abstract class Enemy extends GameObject
{
  Enemy(float x, float y, float w, float h)
  {
    super(x, y, w, h);
  }

  public void act()
  {
    super.act();
  }

  public void reactions()
  {
    for (int x = 0; x < collisions.size(); x++)
    {
      GameObject o = collisions.get(x);

      // is [variablename] an instance of the class [classname]
      if (o.isAlive && o instanceof PlayerProjectile)
      {
        takeDamage(o.getDamage());
      }
    }
  }
}