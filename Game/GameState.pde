class GameState {
	boolean is_key_pressed;
	boolean key_up;
	boolean key_down;
	boolean key_left;
	boolean key_right;

	int m_current_milli; // Current system clock milliseconds
	float m_dt; // Seconds passed from last cycle

	GameState() {
		is_key_pressed = false;
		key_up = false;
		key_down = false;
		key_left = false;
		key_right = false;

		m_current_milli = 0;
		m_dt = 0;
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

	float dt() {
		return m_dt;
	}

	// Setters
	void set_up(boolean pressed) {
		key_up = pressed;
	}

	void set_down(boolean pressed) {
		key_down = pressed;
	}

	void set_left(boolean pressed) {
		key_left = pressed;
	}

	void set_right(boolean pressed) {
		key_right = pressed;
	}

	// Updating Functions
	void update() {
		update_time();			
	}

	void update_time() {
		int old_milli = m_current_milli;
		m_current_milli = millis();

		if (m_current_milli > old_milli) {
			m_dt = (m_current_milli - old_milli)/1000.0;
		}
		else {
			m_dt = ((m_current_milli + 1000) - old_milli)/1000.0;
		}
	}
}
