class EnemyTurret {
  float x, y;
  int w, h;
  int helicopterSX;
  int bigTurretCountdown, smallTurretCountdown, helicopterCountdown;
  int bigTurretLife, smallTurretLife;
  PImage bigTurret, smallTurret, helicopterRight, helicopterLeft;





  EnemyTurret(int w, int h, float x, float y) {
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;

    bigTurretCountdown = floor(random(250, 450));
    bigTurretLife = 10;

    smallTurretCountdown = floor(random(50, 250));
    smallTurretLife = 5;

    helicopterCountdown = floor(random(450, 650));
    helicopterSX = 4;

    bigTurret = loadImage("bigTurret.png");
    smallTurret = loadImage("smallTurret.png");
    helicopterRight = loadImage("spaceLaser_right.png");
    helicopterLeft = loadImage("spaceLaser_left.png");
  }

  void bigTurretRender() {
    image(bigTurret, this.x, this.y, this.w, this.h);

    //big turret shooting algorithm 
    if (bigTurretCountdown == 0) {
      bigTurretBullets.add(new Bullet(this.x + -10, this.y + 45, player.x + player.w, player.y + (player.h/2), 20, 230, 0, 0)); //shoot bullet 
      bigTurretCountdown = floor(random(250, 450));
    }  
    if (bigTurretCountdown > 0) {
      bigTurretCountdown --;
    }

    //player bullet vs big turret collision
    for (int i=0; i < playerBullets.size(); i++) {
      if (collisionDetection(playerBullets.get(i).x, playerBullets.get(i).y, this.x, this.y, this.h, this.w) == true) { //call to collision detection function to check if player bullet has hit turret
        bigTurretLife--; //decrement turret life
        playerBullets.get(i).x = -100; 
        playerBullets.get(i).y = -100;
        if (bigTurretLife < 0) {
          this.x = -500;
          playerKillStreak = playerKillStreak + 10; //add 10 points to player kill streak
        }
      }
    }
  }

  void smallTurretRender() {
    image(smallTurret, this.x, this.y, this.w, this.h);

    //small turret shooting algorithm 
    if (smallTurretCountdown == 0) {
      smallTurretBullets.add(new Bullet(this.x + 20, this.y + 30, player.x + player.w, player.y + (player.h/2), 10, 230, 0, 0)); //shoot bullet 
      smallTurretCountdown = floor(random(50, 250));
    }  
    if (smallTurretCountdown > 0) {
      smallTurretCountdown--;
    }

    //player bullet vs small turret collision
    for (int i=0; i < playerBullets.size(); i++) {
      if (collisionDetection(playerBullets.get(i).x, playerBullets.get(i).y, this.x, this.y, this.h, this.w) == true) { //call to collision detection function to check if player bullet has hit turret
        smallTurretLife--;
        playerBullets.get(i).x = -100;
        playerBullets.get(i).y = -100;
        if (smallTurretLife < 0) {
          this.x = -500;
          playerKillStreak = playerKillStreak + 5; //add 5 points to player kill streak
        }
      }
    }
  }

  
  void helicopterRender() {
    this.x = this.x + helicopterSX;

    //limits the turret to bounce within the 200 and 1000
    if (this.x > 1000) { 
      helicopterSX = -4;
    } else if (this.x < 200) {
      helicopterSX = 4;
    }

    //controls direction of helicopter
    if (helicopterSX == -4) {
      image(helicopterLeft, this.x, this.y, this.w, this.h);
    } else if (helicopterSX == 4) {
      image(helicopterRight, this.x, this.y, this.w, this.h);
    }

    //helicopter dropping bombs algorithm 
    if (helicopterCountdown == 0) {
      for (int i=0; i <5; i++) { //limits to 5 bombs
        helicopterBullets.add(new Bullet(this.x + 100, this.y + 100, floor(random(200, width - 200)), height, 50, 0, 0, 0));
      }
      helicopterCountdown = floor(random(450, 650));
    }  
    if (helicopterCountdown > 0) {
      helicopterCountdown--;
    }
  }
}
