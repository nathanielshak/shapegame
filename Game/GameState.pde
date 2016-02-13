class GameState {
	boolean is_key_pressed;
	boolean key_up;
	boolean key_down;
	boolean key_left;
	boolean key_right;

	int curr_hour, curr_minute, curr_second; // Current clock time
	int dt; // Time passed from last cycle
	int seconds_passed;

	GameState() {
		is_key_pressed = false;
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

	// Getters
	boolean key_pressed() {
		return is_key_pressed;
	}

	boolean up() {
		return key_up;
	}

	boolean down() {
		return key_down;
	}

	boolean left() {
		return key_left;
	}

	boolean right() {
		return key_right;
	}

	// Setters
	void toggle_up() {
		key_up = !key_up;
	}

	void toggle_down() {
		key_down = !key_down;
	}

	void toggle_left() {
		key_left = !key_left;
	}

	void toggle_right() {
		key_right = !key_right;
	}

	// Updating Functions
	void update() {
		update_time();			
	}

	void update_time() {
		println("Time Updated");
		int old_hour = curr_hour;
		int old_minute = curr_minute;
		int old_second = curr_second;

		curr_hour = hour();
		curr_minute = minute();
		curr_second = second();

		if (curr_second > old_second) {
			dt = curr_second - old_second;
			seconds_passed += dt;
		}
		else {
			dt = (curr_second + 60) - old_second;
			seconds_passed += dt;
		}
	}
}
