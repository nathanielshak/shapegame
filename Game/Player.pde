public class Player {
  
  float x;
  float y;
  float size;
  float speed;
  
  Player(){
    x = 30;
    y = 30;
    size = 50;
  }
  
  public void display(){
    rect(x, y, size, size);  
  }
  
  public void update(GameState gs){
    if (gs.up() == UP){
      
      y -= speed;  
    }
    else if (gs.down() == DOWN){
      y += speed;  
    }
    else if (gs.right() == RIGHT){
      x += speed;  
    }
    else if (gs.left() == LEFT){
      x -= speed;  
    }
    
  }
  
}
