class PlayerTurret {
  int x, y, w, h;
  int smallPlayerTurretCountdown;
  int flag;
  int tempX, tempY;
  int counter;
  PImage turret;


  PlayerTurret(int w, int h) {

    this.w = w;
    this.h = h;
    this.flag = 0;
    this.counter = 100;
    turret = loadImage("turret.png");
  }  

  void render() {

    //use mouse to see where to place turret
    if (this.flag == 0) {
      this.tempX = mouseX;
      this.tempY = mouseY;
      image(turret, tempX, tempY, this.w, this.h);
    }

    //confirm turret placement
    if (keyPressed) {
      if (key == 'x' || key == 'X') {
        this.x = tempX;
        this.y = tempY;
        this.flag = 1;
      }
    }

    //draw turret
    image(turret, this.x, this.y, this.w, this.h);

    //bullet shooting at enemy soldiers algorithm
    for (int i=0; i < soldiers.size(); i++) {
      if (counter < 0) {
        if (soldiers.get(i).x > this.x + this.w ) {
          playerTurretBullets.add(new Bullet(this.x + this.w, this.y + 50, soldiers.get(i).x - 200, soldiers.get(i).y + 50, 10, 255, 153, 0));       
          counter = 100;
        }
      } else if (counter > -1) {
        counter--;
      }
    }
  }
}
