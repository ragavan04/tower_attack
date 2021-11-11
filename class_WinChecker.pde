class WinChecker {
  int lossFlag, winFlag;

  WinChecker() {
    this.lossFlag = 0;
    this.winFlag = 0;
  }



  void render() {

    if (player.playerLife < 0) {
      this.lossFlag = 1;
      screen = 2;
    }

    if (scoringSystem.enemyScore == 15) {
      this.lossFlag = 1;
      screen = 2;
    }

    if (scoringSystem.playerScore == 15) {
      this.winFlag = 1;
      screen = 2;
    }
  }
}
