/****************************************************\
 
 Game Object
 (the super class of player, enemy, and projectiles)
 
 \****************************************************/
abstract class GameObject
{
  ArrayList<GameObject> collisions;
  protected int shotTimer;
  protected int timer;
  protected PImage image;
  protected boolean isAlive;
  protected boolean invulnerable;
  protected float curHealth;
  protected float maxHealth;
  protected float damage;
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected float xSpeed;
  protected float ySpeed;
  protected int duration;
  protected int shieldTimer;
  protected color shieldColor;

  public float getX() 
  {
    return x;
  }
  public float getY() 
  { 
    return y;
  }
  public float getWidth() 
  { 
    return w;
  }
  public float getHeight() 
  { 
    return h;
  }

  public float getDamage()
  {
    return damage;
  }

  public float getCurHealth()
  {
    return curHealth;
  }

  // This method does not work the way it's supposed to!
  // Player should LOSE HEALTH equal to "amount"
  // Player only dies if it has too little health!
  // Make sure health never drops below zero
  public void takeDamage(float amount)
  {
    shieldTimer = 10;
    curHealth-=amount;
  }

  GameObject(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    isAlive = true;
    collisions = new ArrayList<GameObject>();
    image = defaultImage;
    curHealth = 1;
    maxHealth = 1;
    timer = 0;
    damage = 0;
    shotTimer = 15;
    shieldTimer = 0;
    shieldColor = color(120, 0, 0, 120);
  }

  boolean containsPoint(float xPos, float yPos)
  {   
    return xPos >= x && xPos <= x+w && yPos >= y && yPos <= y+h;
  }   

  boolean isCollision(GameObject o)
  {
    if (this == o) return false;

    if (containsPoint(o.x, o.y))
    {
      return true;
    }
    if (containsPoint(o.x+o.w, o.y))   
    {
      return true;
    }
    if (containsPoint(o.x, o.y+o.h)) 
    {
      return true;
    }
    if (containsPoint(o.x+o.w, o.y+o.h)) 
    {
      return true;
    }

    return false;
  }

  boolean mouseOver()
  {
    return containsPoint(mouseX, mouseY);
  }

  void render()
  {
    image(image, x, y, w, h);
    if (shieldTimer > 0 && !(this instanceof Projectile)) {
      fill(shieldColor);
      ellipse(x+w/2, y+h/2, w*1.3, h*1.3);
    }
  }

  public abstract void reactions();

  void act()
  {
    if (!collisions.isEmpty())
    {
      reactions();
      collisions.clear();
    }
    shotTimer++;
    timer++;
    x = x + xSpeed;
    y = y + ySpeed;
    if (curHealth <= 0 && isAlive) {
      die();
    }
    if (shieldTimer > 0) {
      shieldTimer--;
    }
  }

  void addCollision(GameObject o)
  {
    for (GameObject c : collisions)
    {
      if (o == c)
      {
        return;
      }
    }
    collisions.add(o);
  }

  void die()
  {
    curHealth = 0;
    isAlive = false;
  }

  void cleanUp()
  {
    if (!isAlive)
    {
      objects.remove(this);
    }
  }
}