/****************************************************\
 
                   Evil Square
               (a subclass of Enemy)
 
\****************************************************/


class EvilSquare extends Enemy
{
   EvilSquare(float x, float y)
   {   
      super(x, y, redSquare.width, redSquare.height);
      xSpeed = EVIL_SQUARE_X_SPEED;
      ySpeed = EVIL_SQUARE_Y_SPEED;
      image = redSquare;
   }

   public void act()
   {
      super.act();

      // This code causes the enemy to wrap when it goes to the bottom of the screen
      if (y > height) 
      {
         y = -image.height;
      }
      
      // This enemy does not know how to shoot - fix that!
      
   }
}