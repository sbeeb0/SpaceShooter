class Star {
  private float x;
  private float y;
  private float size;
  Star(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  void act() {
    fill(255);
    ellipse(x, y, size, size);
  }
}