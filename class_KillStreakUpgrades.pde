class KillStreakUpgrades {
  int x, y, w, h;
  String text;
  int upgradeType;
  int healthFlag, botFlag, turretFlag;
  int red, green, blue;

  KillStreakUpgrades(int x, int y, int w, int h, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;

    this.healthFlag = 0;
    this.botFlag = 0;
    this.turretFlag = 0;
    this.red = 160;
    this.green = 165;
    this.blue = 158;
  }



  void render() {
    fill(red, green, blue);
    rect(this.x, this.y, this.w, this.h);
    fill(0);
    textSize(14);
    text(this.text, this.x + 4, this.y + 22);

    //display kill streak upgrade options
    if (this.text == "Regain Health - 2 Kills" && playerKillStreak >= 2) {
      this.red = 35;
      this.green = 160;
      this.blue = 60;
    }
    if (this.text == "Initiate Bots - 5 Kills" && playerKillStreak >= 5) {
      this.red = 35;
      this.green = 160;
      this.blue = 60;
    }
    if (this.text == "Build Turret - 10 Kills" && playerKillStreak >= 10) {
      this.red = 35;
      this.green = 160;
      this.blue = 60;
    }


  
    if (mousePressed == true) {
      if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h)
        if (this.text == "Regain Health - 2 Kills" && playerKillStreak >= 2 && this.healthFlag == 0) { //health power up 
          this.healthFlag = 1;
          this.red = 255;
          this.green = 0;
          this.blue = 0;
        }
      if (this.text == "Initiate Bots - 5 Kills" && playerKillStreak >= 5 && this.botFlag == 0) { //bot power up
        this.botFlag = 1;
        this.red = 255;
        this.green = 0;
        this.blue = 0;
      }
      if (this.text == "Build Turret - 10 Kills" && playerKillStreak >= 10 && this.turretFlag == 0) { //turret power up
        this.turretFlag = 1;
        this.red = 255;
        this.green = 0;
        this.blue = 0;
      }
    }
  
    //if power up button pressed then initiate powerup
    if (healthFlag == 1) {
      player.playerLife = player.playerLife + 100;
    }
    if (botFlag == 1) {
      for (int i=0; i < bot.size(); i++) bot.get(i).render();
    }
    if (turretFlag == 1) {
      playerTurret.render();
    }
  }
}
