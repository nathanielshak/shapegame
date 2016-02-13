enum HitFrom {
	TOP,
	BOTTOM,
	LEFT,
	RIGHT,
	ENUM_SIZE
};

class Object {
	String m_name;
	float m_left, m_right, m_top, m_bottom;
	float m_x, m_y;
	float m_dx, m_dy;
	boolean m_visible;
	boolean m_solid;
	boolean m_marked_for_adjustment;

	Object(String n, float x, float y, float w, float h) {	
		m_name = n;
		m_x = x;
		m_y = y;
		update_hitbox(w, h);
		m_dx = 0;
		m_dy = 0;
		m_visible = false;
		m_solid = false;
		m_marked_for_adjustment = false;
	}

	String name() {
		return m_name;
	}

	float left() {
		return m_left;
	}

	float right() {
		return m_right;
	}

	float top() {
		return m_top;
	}

	float bottom() {
		return m_bottom;
	}

	boolean solid() {
		return m_solid;
	}

	void set_solid(boolean is_solid) {
		m_solid = is_solid;
	}

	boolean visible() {
		return m_visible;
	}

	void set_visible(boolean is_visible) {
		m_visible = is_visible;
	}

	void update_hitbox(float w, float h) {
		m_left = m_x;
		m_right = m_x + w;
		m_top = m_y;
		m_bottom = m_y + h;
	}

	void adjusted() {
		m_marked_for_adjustment = false;
	}

	boolean colliding_with(Object o) {
		if (((m_bottom < o.bottom() && m_bottom > o.top()) ||
			(m_top > o.top() && m_top < o.bottom())) &&
			((m_right < o.right() && m_right > o.left()) ||
			(m_left > o.left() && m_left < o.right()))) {
			return true;
		}	

		return false;
	}	


	void update(GameState gs) {};

	void display() {
		println("Object display");	
	};
}
