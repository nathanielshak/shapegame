import java.lang.Math;

public interface Collidable {
	public void on_collision_enter(Object o);
}

enum HitFrom {
	TOP,
	BOTTOM,
	LEFT,
	RIGHT,
	ENUM_SIZE
};

class Object implements Collidable {
	String m_name;
	float m_left, m_right, m_top, m_bottom;
	float m_x, m_y;
	float m_dx, m_dy;
	float m_ddx, m_ddy;
	boolean m_visible;
	boolean m_solid;
	boolean m_movable;
	boolean m_marked_for_adjustment;

	Object(String n, float x, float y, float w, float h) {	
		m_name = n;

		m_x = x;
		m_y = y;

		m_left = x;
		m_right = x + w;
		m_top = y;
		m_bottom = y + h;	
		
		m_dx = 0;
		m_dy = 0;
		m_ddx = 0;
		m_ddy = 0;
		
		m_visible = false;
		m_solid = false;
		m_movable = true;
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

	void set_movable(boolean is_movable) {
		m_movable = is_movable;
	}

	boolean movable() {
		return m_movable;
	}

	boolean visible() {
		return m_visible;
	}

	void set_visible(boolean is_visible) {
		m_visible = is_visible;
	}
	
	void set_velocity(float dx, float dy) {
		m_dx = dx;
		m_dy = dy;
	}

	void set_acceleration(float ddx, float ddy) {
		m_ddx = ddx;
		m_ddy = ddy;
	}

	void update_hitbox() {
		float width = m_right - m_left;
		float height = m_bottom - m_top;

		m_left = m_x;
		m_right = m_x + width;
		m_top = m_y;
		m_bottom = m_y + height;
	}

	void adjusted() {
		m_marked_for_adjustment = false;
	}

	boolean colliding_with(Object o) {
		if (this != o) {
			if (((m_bottom < o.bottom() && m_bottom > o.top()) ||
				(m_top > o.top() && m_top < o.bottom())) &&
				((m_right < o.right() && m_right > o.left()) ||
				(m_left > o.left() && m_left < o.right()))) {
				on_collision_enter(o);
				o.on_collision_enter(this);
				return true;
			}
			else if (m_top == o.top() &&
					m_bottom == o.bottom() &&
					(m_left < o.right() ||
					 m_right > o.left())) {
				on_collision_enter(o);
				o.on_collision_enter(this);
				return true;
			}	
			else if (m_left == o.left() &&
					m_right == o.right() &&
					((m_bottom > o.top() &&
					  m_top < o.bottom()) ||
					 (m_top < o.bottom() &&
					  m_bottom > o.top()))) {
				on_collision_enter(o);
				o.on_collision_enter(this);
				return true;
			}
		}

		return false;
	}	

	void check_for_collisions_with(List<Object> o) {
		for (int i=0; i<o.size(); i++) {
			if (colliding_with(o.get(i))) {
				m_marked_for_adjustment = true;
			}
		}
	}

	void adjust_position(List<Object> objects) {
		if (m_marked_for_adjustment) {
			for (int i=0; i<objects.size(); i++) {
				if (colliding_with(objects.get(i))) {
					float dx, dy;
					if (m_top > objects.get(i).top() && m_top < objects.get(i).bottom()) {
						dy = objects.get(i).bottom() - m_top;
					}
					else {
						dy = objects.get(i).top() - m_bottom;
					}

					if (m_right > objects.get(i).left() && m_right < objects.get(i).right()) {
						dx = objects.get(i).left() - m_right;
					}
					else {
						dx = objects.get(i).right() - m_left;
					}
				
					if (abs(dy) < abs(dx)) {
						m_y += dy;
						m_dy = 0;
					}
					else {
						m_x += dx;
						m_dx = 0;
					}

					update_hitbox();
					adjusted();
					objects.get(i).adjusted();
				}
			}
		}
	}

	void update(GameState gs) {};

	void apply_velocity() {
		if (!m_movable) {
			m_dx = 0;
			m_dy = 0;
			m_ddx = 0;
			m_ddy = 0;
		}
		else {
			m_x += m_dx;
			m_y += m_dy;
		}
		update_hitbox();
	}

	void apply_acceleration(float max_dx, float max_dy) {
		m_dx += m_ddx;
		if (abs(m_dx) > abs(max_dx)) {
			m_dx = max_dx;
		}
		m_dy += m_ddy;
		if (abs(m_dy) > abs(max_dy)) {
			m_dy = max_dy;
		}
	}

	void display() {}

	void on_collision_enter(Object o) { 
		println("Collision Enter. Hit: " + o.name()); 
	}
}