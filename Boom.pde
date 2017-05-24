class Boom extends GameObject {
  int timer = 8;
  float size = 20;

  Boom(float x, float y, float size) {
    super(x, y, 0, 0);
    this.size = size;
    this.w = size;
    this.h = size;
    this.y = y + this.h/2;
  }

  void render() {
    image(boom, x, y, w, h);
  }

  void act() {
    if (timer > 1) {
      timer--;
    }

    if (timer == 1) {
      if (size > 3) {
        objects.add(new Boom(this.x + this.w / 2.0 + random(-this.w / 2.0, this.w / 2.0), this.y + this.h / 2.0 + random(-this.h / 2.0, this.h / 2.0), this.size / 2.5));
        objects.add(new Boom(this.x + this.w / 2.0 + random(-this.w / 2.0, this.w / 2.0), this.y + this.h / 2.0 + random(-this.h / 2.0, this.h / 2.0), this.size / 2.5));
        objects.add(new Boom(this.x + this.w / 2.0 + random(-this.w / 2.0, this.w / 2.0), this.y + this.h / 2.0 + random(-this.h / 2.0, this.h / 2.0), this.size / 2.5));
      }
      timer--;
    }

    if (timer == 0) {
      super.die();
    }
  }
  void reactions() {
    // Reactions required to be considered a gameobject
  }
}