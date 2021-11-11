class GarbageCollection {

  GarbageCollection() {
  }

  void render() {
    //garbage collection for player bullets
    for (int i=0; i < playerBullets.size(); i++) {
      if (playerBullets.get(i).x < 0 || playerBullets.get(i).x > width || playerBullets.get(i).y < 0 || playerBullets.get(i).y > height) { //if there are random bullets that are not on the screen then remove them
        playerBullets.remove(i);
      }
    }

    //garbage collection for player bullets
    for (int i=0; i < botBullets.size(); i++) {
      if (botBullets.get(i).x < 0 || botBullets.get(i).x > width || botBullets.get(i).y < 0 || botBullets.get(i).y > height) { //if there are random bullets that are not on the screen then remove them
        botBullets.remove(i);
      }
    }

    //garabage collection for big turret bullets
    for (int i=0; i < bigTurretBullets.size(); i++) {
      if (bigTurretBullets.get(i).x < 0 || bigTurretBullets.get(i).x > width || bigTurretBullets.get(i).y < 0 || bigTurretBullets.get(i).y > height) { //if there are random bullets that are not on the screen then remove them
        bigTurretBullets.remove(i);
      }
    }

    //garabage collection for small turret bullets
    for (int i=0; i < smallTurretBullets.size(); i++) {
      if (smallTurretBullets.get(i).x < 0 || smallTurretBullets.get(i).x > width || smallTurretBullets.get(i).y < 0 || smallTurretBullets.get(i).y > height) { //if there are random bullets that are not on the screen then remove them
        smallTurretBullets.remove(i);
      }
    }

    //garbage collection for dead enemy soldiers
    for (int i=0; i < soldiers.size(); i=i+1) {
      if (soldiers.get(i).x < 0 || soldiers.get(i).x > width || soldiers.get(i).y < 0 || soldiers.get(i).y > height) { //if there are random zombies that are not on the screen then remove them
        soldiers.remove(i);
      }
    }

    //garbage collection for dead bots soldiers
    for (int i=0; i < bot.size(); i=i+1) {
      if (bot.get(i).x < 0 || bot.get(i).x > width || bot.get(i).y < 0 || bot.get(i).y > height) { //if there are random zombies that are not on the screen then remove them
        bot.remove(i);
      }
    }
  }
}
