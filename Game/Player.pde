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
  
  public void update(char keyStroke){
    println(keyStroke);
    if (keyStroke == UP){
      
      y -= speed;  
    }
    else if (keyStroke == DOWN){
      y += speed;  
    }
    else if (keyStroke == RIGHT){
      x += speed;  
    }
    else if (keyStroke == LEFT){
      x -= speed;  
    }
    
  }
  
}