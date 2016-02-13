import java.util.Map;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;

public enum ObjectID {
	PLAYER,
	OBSTACLE1,
	BOUNDARY_TOP,
	BOUNDARY_LEFT,
	BOUNDARY_RIGHT,
	BOUNDARY_BOTTOM,
};

//Map<ObjectID, Object> game_objects;
GameState game_state;
List<Level> levels;
Level curLevel;

void setup(){
	size(500,500);

  curLevel = new Level1();
	game_state = new GameState();
}

void draw(){
	background(255,255,255);
	game_state.update();

	List<Object> game_objs_list = curLevel.game_objects;

	for (int i=0; i<game_objs_list.size(); i++) {
		game_objs_list.get(i).update(game_state);
	}

	for (int i=0; i<game_objs_list.size(); i++) {
		game_objs_list.get(i).apply_velocity();
		game_objs_list.get(i).apply_acceleration(5, 5);
	}

	for (int i=0; i<game_objs_list.size(); i++) {
		game_objs_list.get(i).check_for_collisions_with(game_objs_list);
	}
	
	for (int i=0; i<game_objs_list.size(); i++) {
		if (game_objs_list.get(i).movable()) {
			game_objs_list.get(i).adjust_position(game_objs_list);
		}
	}

	for (int i=0; i<game_objs_list.size(); i++) {
		game_objs_list.get(i).display();
	}
}

void keyPressed() {
	if (keyCode == UP) {
		game_state.set_up(true);
	}

	if (keyCode == DOWN) {
		game_state.set_down(true);
	}

	if (keyCode == LEFT) {
		game_state.set_left(true);
	}

	if (keyCode == RIGHT) {
		game_state.set_right(true);
	}
}

void keyReleased() {
	if (keyCode == UP) {
		game_state.set_up(false);
	}

	if (keyCode == DOWN) {
		game_state.set_down(false);
	}

	if (keyCode == LEFT) {
		game_state.set_left(false);
	}

	if (keyCode == RIGHT) {
		game_state.set_right(false);
	}
}
