public class CollisionObject extends Object {
	float m_width;
	float m_height;
	float m_dx;
	float m_dy;
	boolean canKill;

	CollisionObject(String name, float x, float y, float w, float h) {
		super(name, x, y, w, h);
		m_width = w;
		m_height = h;
		m_dx = 0;
		m_dy = 0;
		canKill = false;
	}

	void display() {
		if (m_visible) {
			rect(m_x, m_y, m_width, m_height);
		}
	}

	void set_size(float w, float h) {
		m_width = w;
		m_height = h;
	}

	void set_kill(boolean setKill) {
		canKill = setKill;
	}

	void on_collision_enter(Object o) {
		if(canKill && o.name().equals("Player")) {
			((Player)o).kill();
		}
	}

	public void update(GameState gs) {
		m_x += m_dx;
		m_y += m_dy;
		if (m_dx > 0.05) {
			m_dx -= 0.1;
		}
		else if (m_dx < -0.05) {
			m_dx += 0.1;
		}

		if (m_dy > 0.05) {
			m_dy -= 0.1;
		}
		else if (m_dy < -0.05) {
			m_dy += 0.1;
		}
	}

	/*
	void handle_collision(Object o) {
		ArrayList<HitFrom> collisions = get_collisions_with(o);
		if (collisions.contains(HitFrom.LEFT)) {
			m_dx = 0.05;
		}		
		else if (collisions.contains(HitFrom.RIGHT)) {
			m_dx = -0.05;
		}
	}
	*/
}