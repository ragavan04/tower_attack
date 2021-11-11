class ScoringSystem {
  int playerScoreX, playerScoreY, enemyScoreX, enemyScoreY, w, h;
  int playerScore;
  int enemyScore;

  ScoringSystem() {
    this.playerScoreX = 1404;
    this.playerScoreY = 580;
    this.enemyScoreX = 35;
    this.enemyScoreY = 580;
    this.w = 60;
    this.h = 60;
  }

  void render() {
    fill(0, 0, 255);
    rect(this.playerScoreX, this.playerScoreY, this.w, this.h);
    fill(0);
    textSize(45);
    text(playerScore, this.playerScoreX + 15, this.playerScoreY + 47);

    for (int i=0; i < bot.size(); i++) {
      if (bot.get(i).x > enemyTower.x + (enemyTower.w/2)) {
        bot.get(i).y = -500; 
        playerScore++;
      }
    }


    fill(255, 0, 0);
    rect(this.enemyScoreX, this.enemyScoreY, this.w, this.h);
    fill(0);
    textSize(45);
    text(enemyScore, this.enemyScoreX + 15, this.enemyScoreY + 47);

    for (int i=0; i < soldiers.size(); i++) {
      if (soldiers.get(i).x < playerTower.x + (playerTower.w/2)) {
        soldiers.get(i).y = -500; 
        enemyScore++;
      }
    }
  }
}
