class FriendlyBot extends Mover {
  int w, h;
  int counter;
  PImage bot;



  FriendlyBot(float x, float y) {
    super(x, y);
    this.w = 100;
    this.h = 100;
    this.sx = 1;
    counter = 30;
    bot = loadImage("bots.png");
  }

  void render() {
    this.move();
    fill(#E5CD13);
    image(this.bot, this.x, this.y, this.w, this.h);  

    //bot algorithm to follow enemy soldiers
    for (int i=0; i < soldiers.size(); i++) {
      if (this.x < soldiers.get(i).x) {
        this.sx = +1;
      } else if (this.x > soldiers.get(i).x) {
        this.sx = -1;
      }
    }

    //render bot bullets
    for (int i=0; i < botBullets.size(); i++) botBullets.get(i).shoot();

    //bot shooting at enemy soldiers
    for (int i=0; i < soldiers.size(); i++) {
      if (this.x > soldiers.get(i).x - 300 && this.x < soldiers.get(i).x) { //if enemy soldiers are within 300 pixels then shoot
        if (counter < 0) {
          botBullets.add(new Bullet(this.x + this.w, this.y + 35, soldiers.get(i).x, soldiers.get(i).y, 5, 185, 232, 0)); //shoot bullets
          counter = 30; //counter limits the numbers of bullets shot at once
        } else if (counter > -1) {
          counter--;
        }
      }
    }

    //big turret bullet vs bot collision
    for (int i=0; i < bigTurretBullets.size(); i++) {
      if (collisionDetection(bigTurretBullets.get(i).x, bigTurretBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        this.y = -500;
      }
    }

    //small turret bullet vs bot collision
    for (int i=0; i < smallTurretBullets.size(); i++) {
      if (collisionDetection(smallTurretBullets.get(i).x, smallTurretBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        this.y = -500;
      }
    }

    //helicopter bullet vs bot collision
    for (int i=0; i < helicopterBullets.size(); i++) {
      if (collisionDetection(helicopterBullets.get(i).x, helicopterBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        this.y = -500;
      }
    }
  }
}
