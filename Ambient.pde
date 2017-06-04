abstract class Ambient {
  float x;
  float y;
  float size;
  Ambient(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  abstract void update();
  abstract void render();
}

class Boom extends Ambient {
  int timer = 8;
  float size = 20;
  float x;
  float y;
  Boom(float x, float y, float size) {
    super(x, y, size);
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void render() {
    image(boom, x, y, size, size);
  }

  void update() {
    if (timer > 1) {
      timer--;
    }

    if (timer == 1) {
      if (size > 3) {
        ambience.add(new Boom(this.x + this.size / 2.0 + random(-this.size / 2.0, this.size / 2.0), this.y + this.size / 2.0 + random(-this.size / 2.0, this.size / 2.0), this.size / 2.5));
        ambience.add(new Boom(this.x + this.size / 2.0 + random(-this.size / 2.0, this.size / 2.0), this.y + this.size / 2.0 + random(-this.size / 2.0, this.size / 2.0), this.size / 2.5));
        ambience.add(new Boom(this.x + this.size / 2.0 + random(-this.size / 2.0, this.size / 2.0), this.y + this.size / 2.0 + random(-this.size / 2.0, this.size / 2.0), this.size / 2.5));
      }
      timer--;
    }

    if (timer == 0) {
      ambience.remove(this);
    }
  }
}

class Star extends Ambient {
  private float x;
  private float y;
  private float size;
  Star(float x, float y, int size) {
    super(x, y, size);
    this.x = x;
    this.y = y;
    this.size = size;
  }
  void render() {

    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }

  void update() {
    y+=size-1;
    if (y > height) {
      y-=height;
    }
  }
}