//declare all variables
Player player;
EnemyTurret bigTurret, smallTurret, helicopter;
PlayerTurret playerTurret;
Tower enemyTower;
Tower playerTower;
GarbageCollection garbageCollection;
KillStreakUpgrades health, bots, turrets;
ScoringSystem scoringSystem;
WinChecker winChecker;

int soldierSpawnCountdown, botSpawnCountdown;
int playerKillStreak;
int screen;

//declare arraylists  
ArrayList<Bullet> playerBullets = new ArrayList<Bullet>();
ArrayList<Bullet> playerTurretBullets = new ArrayList<Bullet>();
ArrayList<Bullet> bigTurretBullets = new ArrayList<Bullet>();
ArrayList<Bullet> smallTurretBullets = new ArrayList<Bullet>();
ArrayList<Bullet> helicopterBullets = new ArrayList<Bullet>();
ArrayList<Bullet> botBullets = new ArrayList<Bullet>();
ArrayList<EnemySoldier> soldiers = new ArrayList<EnemySoldier>();
ArrayList<FriendlyBot> bot = new ArrayList<FriendlyBot>();
PImage inGame;



void setup() {
  size(1500, 720);
  frameRate(60);

  playerKillStreak = 0;
  player = new Player();
  bigTurret = new EnemyTurret(245, 250, width - 377, height - 252);
  smallTurret = new EnemyTurret(161, 134, width - 150, height - 398);
  playerTurret = new PlayerTurret(200, 200);
  helicopter = new EnemyTurret(331, 158, 500, 0);
  enemyTower = new Tower(1373, 440, 119, 280);
  playerTower = new Tower(5, 440, 119, 280);
  garbageCollection = new GarbageCollection();
  health = new KillStreakUpgrades(5, 90, 160, 35, "Regain Health - 2 Kills");
  bots = new KillStreakUpgrades(5, 138, 160, 35, "Initiate Bots - 5 Kills");
  turrets = new KillStreakUpgrades( 5, 188, 160, 35, "Build Turret - 10 Kills");
  scoringSystem = new ScoringSystem();
  winChecker = new WinChecker();
  inGame = loadImage("inGame.jpeg");
}


void draw() {
  background(inGame);

  //render all objects
  player.render();
  bigTurret.bigTurretRender();
  smallTurret.smallTurretRender();
  helicopter.helicopterRender();
  enemyTower.enemy();
  playerTower.player();
  garbageCollection.render();
  health.render();
  bots.render();
  turrets.render();
  scoringSystem.render();
  winChecker.render();

  //using a for loop render all objects that are an istance of an arraylist
  for (int i=0; i < playerBullets.size(); i++) playerBullets.get(i).shoot();
  for (int i=0; i < playerTurretBullets.size(); i++) playerTurretBullets.get(i).shoot();
  for (int i=0; i < bigTurretBullets.size(); i++) bigTurretBullets.get(i).shoot();
  for (int i=0; i < smallTurretBullets.size(); i++) smallTurretBullets.get(i).shoot();
  for (int i=0; i < helicopterBullets.size(); i++) helicopterBullets.get(i).shoot();
  for (int i=0; i < soldiers.size(); i++) soldiers.get(i).create(); 




  //soldier spawn countdown
  if (soldierSpawnCountdown > 0) {
    soldierSpawnCountdown = soldierSpawnCountdown - 1;
  }
  //if solider spawn count down equals 0 spawn soldiers, vary the timing of spawns depending on how many kills the player has
  if (soldierSpawnCountdown == 0) {
    soldiers.add(new EnemySoldier(floor(random(500, 1400)), height - 100));
    if (playerKillStreak <= 5) {
      soldierSpawnCountdown = floor(random(500, 1000));
    } else if (playerKillStreak >=6 && playerKillStreak <= 10) {
      soldierSpawnCountdown = floor(random(200, 300));
    } else if (playerKillStreak >= 11) {
      soldierSpawnCountdown = floor(random(50, 100));
    } else if (playerKillStreak >= 15) {
      soldierSpawnCountdown = floor(random(0, 50));
    }
  }

  //bot spawn countdown, spawn at random times
  if (botSpawnCountdown > 0) {
    println(botSpawnCountdown);
    botSpawnCountdown = botSpawnCountdown - 1;
  }
  if (botSpawnCountdown == 0) {
    bot.add(new FriendlyBot(100, height -100));
    botSpawnCountdown = floor(random(150, 300));
  }
}


void mousePressed() {
  //shoots bullets for player
  playerBullets.add(new Bullet(player.x + player.w, player.y + 35, mouseX, mouseY, 5, 2, 216, 197));
}

//collision detection function
boolean collisionDetection(float x1, float y1, float x2, float y2, int h2, int w2) {
  boolean result = false;

  if (x1 > x2 && x1 < x2 + w2 && y1 >  y2 && y1 < y2 + h2) {
    result = true;
  }
  return result;
}
