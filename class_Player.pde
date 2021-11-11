class Player {
  float x, y, sx, sy;
  int w, h;
  float playerLife;
  PImage player;


  Player() {

    this.x = 100;
    this.y = height - 100;
    this.w = 100;
    this.h = 100;

    this.sx = 3;

    playerLife = 300;
    
    player = loadImage("player.png");
    
  }

  void render () {
    //draw player
    image(player, this.x, this.y, this.w, this.h);
    
    //display kill streak
    fill(0);
    textSize(20);
    text("Kill Streak: " + playerKillStreak, 5, 71);

    //player movement using left and right arrows
    if (key == CODED) {
      if (keyCode == RIGHT) {
        this.x = this.x + this.sx;
      } else if (keyCode == LEFT) {
        this.x = this.x - this.sx;
      }
    }

    //player health bar
    fill(#797E79);
    rect(5, 10, 300, 30);
    fill(#35B42F);
    rect(5, 10, playerLife, 30);

    //big turret collision vs player
    for (int i=0; i < bigTurretBullets.size(); i++) {
      if (collisionDetection(bigTurretBullets.get(i).x, bigTurretBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        playerLife = playerLife - 25;
        bigTurretBullets.get(i).x = -500;
      }
    }

    //small turret collision vs player
    for (int i=0; i < smallTurretBullets.size(); i++) {
      if (collisionDetection(smallTurretBullets.get(i).x, smallTurretBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        playerLife = playerLife - 15;
        smallTurretBullets.get(i).x = -500;
      }
    }

    //space laser collision vs player
    for (int i=0; i < helicopterBullets.size(); i++) {
      if (collisionDetection(helicopterBullets.get(i).x, helicopterBullets.get(i).y, this.x, this.y, this.h, this.w) == true) {
        playerLife = playerLife - 50;
        helicopterBullets.get(i).x = -500;
      }
    }
  }
}
