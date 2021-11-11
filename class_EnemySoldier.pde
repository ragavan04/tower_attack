class EnemySoldier extends Mover {
  int w, h;
  PImage enemy;


  EnemySoldier(float x, float y) {
    super(x, y);

    this.w = 70;
    this.h = 100;

    this.sx = floor(random(-5, -1));
    enemy = loadImage("enemy.png");
  }

  void create() {
    this.move();

    fill(#FF0009);
    image(enemy, this.x, this.y, this.w, this.h);  


    //player bullet vs enemy collision
    for (int i=0; i < playerBullets.size(); i++) {
      if (collisionDetection(playerBullets.get(i).x, playerBullets.get(i).y, this.x, this.y, this.h, this.w) == true) { //call to collision detection function
        playerBullets.get(i).x = -100; //moves bullet off screen
        playerBullets.get(i).y = -100;
        playerKillStreak++; //add points to players kill streak
        this.y = -500; //moves enemy off screen
      }
    }

    //bot bullet vs enemy collision
    for (int i=0; i < botBullets.size(); i++) {
      if (collisionDetection(botBullets.get(i).x, botBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        botBullets.get(i).x = -100;
        botBullets.get(i).y = -100;
        this.y = -500;
      }
    }

    //player turret bullet vs enemy collision
    for (int i=0; i < playerTurretBullets.size(); i++) {
      if (collisionDetection(playerTurretBullets.get(i).x, playerTurretBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        playerTurretBullets.get(i).x = -100;
        playerTurretBullets.get(i).y = -100;
        this.y = -500;
      }
    }
  }
}
