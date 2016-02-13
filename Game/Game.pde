import java.util.Map;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;

enum ObjectID {
	PLAYER,
	OBSTACLE1,
	ENUM_SIZE,
};

Map<ObjectID, Object> game_objects;
GameState game_state;

void setup(){
	size(500, 500);
	game_objects = new EnumMap<ObjectID, Object>(ObjectID.class);
	game_objects.put(ObjectID.PLAYER, new Player("Player", 0, 90, 30, 30));
	game_objects.get(ObjectID.PLAYER).set_solid(true);
	game_objects.get(ObjectID.PLAYER).set_visible(true);

	game_objects.put(ObjectID.OBSTACLE1, new CollisionObject("Obstacle1", 70, 90, 30, 50));		
	game_objects.get(ObjectID.OBSTACLE1).set_solid(true);
	game_objects.get(ObjectID.OBSTACLE1).set_visible(true);
	game_state = new GameState();
}

void draw(){
	background(255,255,255);
	game_state.update();

	List<Object> game_objs_list = new ArrayList<Object>(game_objects.values());

	for (int i=0; i<game_objs_list.size(); i++) {
		game_objs_list.get(i).update(game_state);
	}

	if (game_objs_list.get(0).colliding_with(game_objs_list.get(1))) {
		println("Collision");
	}
	else {
		println();
	}

	for (int i=0; i<game_objs_list.size(); i++) {
		//game_objs_list.get(i).handle_collisions_with(game_objs_list);
	}

	for (int i=0; i<game_objs_list.size(); i++) {
		game_objs_list.get(i).display();
	}
}

void keyPressed() {
	if (keyCode == UP) {
		game_state.toggle_up();
	}

	if (keyCode == DOWN) {
		game_state.toggle_down();
	}

	if (keyCode == LEFT) {
		game_state.toggle_left();
	}

	if (keyCode == RIGHT) {
		game_state.toggle_right();
	}
}

void keyReleased() {
	if (keyCode == UP) {
		game_state.toggle_up();
	}

	if (keyCode == DOWN) {
		game_state.toggle_down();
	}

	if (keyCode == LEFT) {
		game_state.toggle_left();
	}

	if (keyCode == RIGHT) {
		game_state.toggle_right();
	}
}
