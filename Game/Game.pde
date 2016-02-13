Player player;

void setup(){
  size(500, 500);
  player = new Player();
}

void draw(){
  background(255,255,255);
  player.display();
  if(keyPressed){
    player.update(key);
  }
}