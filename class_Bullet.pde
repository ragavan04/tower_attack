float bulletSpeed = 3.5;

class Bullet extends Mover {
  int size;
  int red, green, blue;
  
  Bullet(float x1, float y1, float x2, float y2, int size, int red, int green, int blue) {
    super(x1, y1); //This is a call to Movers constructor

    //bullet shooting algorithm
    float hyp = dist(x1, y1, x2, y2);  

    float dx = x2 - x1;
    float dy = y2 - y1;

    this.sx = bulletSpeed * dx / hyp;
    this.sy = bulletSpeed * dy / hyp;
    this.size = size;
    
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  void shoot() {
    this.move();

    //draws bullet
    fill(red, green,blue);
    ellipse(this.x, this.y, size, size);
  }
}
