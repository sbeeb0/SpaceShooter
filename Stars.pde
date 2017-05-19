class Star {
  private float x;
  private float y;
  private float size;
  Star(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  void render() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }

  void act(String orientation) {
    if (orientation.equals("DOWN")) {
      if (y > height) {
        y = 0;
      }
      if (size == 2) {
        y+=1;
      } else if (size == 3) {
        y+=2;
      } else if (size == 4) {
        y+=3;
      }
    }
    if (orientation.equals("DIAGONAL")) {
      if (x > width) {
        x = 0;
      }
      if (size == 2) {
        x+=1;
      } else if (size == 3) {
        x+=2;
      } else if (size == 4) {
        x+=3;
      }
      if (y > height) {
        y = 0;
      }
      if (size == 2) {
        y+=1;
      } else if (size == 3) {
        y+=2;
      } else if (size == 4) {
        y+=3;
      }
    }
  }
}