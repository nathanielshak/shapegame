public class Player {  
  float x;
  float y;
  float size;
  float dx;
  float dy;
  
  Player(){
    x = 30;
    y = 30;
    size = 30;
 	dx = 1;
	dy = 1;	
  }
  
  public void display(){
    rect(x, y, size, size);  
  }

	public void set_size(int s) {
		size = s;
	}

  public void update(GameState gs){
    if (gs.up()){ 
		println("Player Up");
		dy -= 1;		
		y += dy;  
    }
	else if (gs.down()){
		println("Player Down");
		dy += 1;		
		y += dy;  
    }
	else if (dy > 0) {
		dy -= 0.2;
		y += dy;  
	}
	else if (dy < 0) {
		dy += 0.2;
		y += dy;  
	}
	else {
		dy = 0;
	}

	if (gs.right()){
		println("Player Right");
		dx += 1;		
		x += dx;  
    }
    else if (gs.left()){
		println("Player Left");
		dx -= 1;		
		x += dx;  
    }
	else if (dx > 0) {
		dx -= 0.2;
		x += dx;  
	}
	else if (dx < 0) {
		dx += 0.2;
		x += dx;  
	}
	else {
		dx = 0;
	}
  }
}
