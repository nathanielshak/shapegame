public class Player extends Object {  
	float m_width;
	float m_height;

	Player(String name, float x, float y, float w, float h){
		super(name, x, y, w, h);
		m_width = w;
		m_height = h;
	}

	public void display() {
		if (m_visible) {
			rect(m_x, m_y, m_width, m_height);  
		}
	}

	public void set_size(float w, float h) {
		m_width = w;
		m_height = h;
	}

	public void update(GameState gs){
		if (gs.up()){ 
			m_dy = -2;		
			m_y += m_dy;  
		}
		else if (gs.down()){
			m_dy = 2;		
			m_y += m_dy;  
		}
		else {
			m_dy = 0;
		}

		if (gs.right()){
			m_dx = 2;		
			m_x += m_dx;  
		}
		else if (gs.left()){
			m_dx = -2;		
			m_x += m_dx;  
		}
		else {
			m_dx = 0;
		}

		update_hitbox();
	}
}
