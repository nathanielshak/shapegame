enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	UP_LEFT,
	UP_RIGHT,
	DOWN_LEFT,
	DOWN_RIGHT,
	WAIT
};

class PatrolBlock extends Object {
	float m_move_time;
	float m_patrol_time;
	float m_wait_time;
	Direction m_dir;
	float m_width;
	float m_height;
	boolean can_kill;

	PatrolBlock(String name, float patrol_time, float x, float y, float w, float h) {	
		super(name, x, y, w, h);
		can_kill = true;
		m_width = w;
		m_height = h;
		m_patrol_time = patrol_time;
		m_wait_time = 2;
		m_dir = Direction.UP;
	}

	void update(GameState gs) {
		move(m_dir, 2);

		m_move_time += gs.dt();
		if (m_dir != Direction.WAIT) {
			if (m_move_time >= m_patrol_time) {
				m_move_time = 0;
				if (m_dir == Direction.UP) {
					m_dir = Direction.DOWN;	
				}
				else if (m_dir == Direction.DOWN) {
					m_dir = Direction.WAIT;
				}
			}
		}
		else {
			if (m_move_time >= m_wait_time) {
				m_move_time = 0;
				m_dir = Direction.UP;
			}
		}
	}

	void display() {
		if (m_visible) {
			rect(m_x, m_y, m_width, m_height);  
		}
	}

	void move(Direction dir, float speed) {
		switch (dir) {
			case UP:
				m_y -= speed;
				break;
			case DOWN:
				m_y += speed;
				break;
			case LEFT:
				m_x -= speed;
				break;
			case RIGHT:
				m_x += speed;
				break;
			case UP_LEFT:
				m_x -= speed;
				m_y -= speed;
				break;
			case UP_RIGHT:
				m_x += speed;
				m_y -= speed;
				break;
			case DOWN_LEFT:
				m_x -= speed;
				m_y += speed;
				break;
			case DOWN_RIGHT:
				m_x += speed;
				m_y += speed;
				break;
			case WAIT:
				break;
		};
	}


	void on_collision_enter(Object o) {
		if (can_kill && o.name().equals("Player")) {
			((Player)o).kill();
		}
	}

}
