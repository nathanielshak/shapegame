Player player;
GameState game_state;

void setup(){
  size(500, 500);
  player = new Player();
  game_state = new GameState();
}

void draw(){
  background(255,255,255);
  player.display();
  game_state.update();
  player.update(game_state);
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
