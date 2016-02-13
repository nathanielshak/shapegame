public class Level {
  
  public List<Object> game_objects;
  public float xGrav;
  public float yGrav;
  
  Level(float xg, float yg) {
    xGrav = xg;
    yGrav = yg;
    initLevel();
  }
  
  //override this
  void initLevel(){
  }
  
  void setGrav(float xg, float yg){
    xGrav = xg;
    yGrav = yg;
  }
  
}

public class Level1 extends Level {
  
  public Level1(){
    super(0,1); 
  }
  
  void initLevel(){
    game_objects = new ArrayList<Object>();
    Object player = new Player("Player", 60, 90, 30, 30);
    player.set_acceleration(xGrav, yGrav);
    game_objects.add(player);
    
    game_objects.add(new CollisionObject("Obstacle1", 240, 90, 30, 50));
    game_objects.add(new CollisionObject("BoundaryTop", 0, -20, 500, 20));
    game_objects.add(new CollisionObject("BoundaryLeft", -20, 0, 20, 500));
    game_objects.add(new CollisionObject("BoundaryRight", 500, 0, 20, 500));
    game_objects.add(new CollisionObject("BoundaryBottom", 0, 500, 500, 20));
    for(Object ob:game_objects){
      ob.set_solid(true);
      ob.set_visible(true);
      if(ob.name().length() > 8 && ob.name().substring(0,8).equals("Boundary")){
        ob.set_movable(false);  
      }
    }
  }
  
}

public class Level2 {
  
  Map<ObjectID, Object> game_objects;
  float xGrav;
  float yGrav;
  
  public Level2() {
      
  }
  
}