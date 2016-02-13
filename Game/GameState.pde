class GameState {
	bool key_pressed;
	bool key_up;
	bool key_down;
	bool key_left;
	bool key_right;

	int curr_hour, curr_minute, curr_second; // Current clock time
	int dt; // Time passed from last cycle
	int seconds_passed;

	GameState() {
		key_pressed = false;
		key_up = false;
		key_down = false;
		key_left = false;
		key_right = false;

		curr_hour = 0;
		curr_minute = 0;
		curr_second = 0;

		dt = 0;
		seconds_passed = 0;
	}

	void update() {
		update_input();
		update_time();			
	}

	void update_input() {
		if (keyPressed()) {
			key_pressed = true;

			if (keyCode == UP) {
				key_up = true;
			}
			else {
				key_up = false;
			}
			
			if (keyCode == DOWN) {
				key_down = true;
			}
			else {
				key_down = false;
			}

			if (keyCode == LEFT) {
				key_left = true;
			}
			else {
				key_left = false;
			}

			if (keyCode == RIGHT) {
				key_right = true;
			}	
			else {
				key_right = false;
			}
		}
	}

	void update_time() {
		int old_hour = current_hour;
		int old_minute = current_minute;
		int old_second = current_second;

		current_hour = hour();
		current_minute = minute();
		current_second = second();

		if (current_second > old_second) {
			dt = current_second - old_second;
			seconds_passed += dt;
		}
		else {
			dt = (current_second + 60) - old_second;
			seconds_passed += dt;
		}
	}
}
