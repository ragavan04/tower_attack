class Tower {
  float h, w, x, y;
  PImage tower;

  Tower(float x, float y, float w, float h) {
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;


    tower = loadImage("tower.png");
  }


  void enemy() {
    image(tower, this.x, this.y, this.w, this.h);
  }


  void player() {
    image(tower, this.x, this.y, this.w, this.h);
  }
}
