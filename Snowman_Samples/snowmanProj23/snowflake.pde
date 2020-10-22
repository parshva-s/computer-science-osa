class Snowflake {
    
    PVector loc;
    PVector vel;
    float size;
    
    Snowflake(float x, float y, float s) {
        loc = new PVector(x, y);
        vel = new PVector(random(-5,5), random(2, 5));
        size = s;
        
    }
    
    void update() {
        loc.add(vel);
    }
    
    
    void display() {
        fill(255);
        ellipse(loc.x, loc.y, size, size);
    }
    
    boolean end() {
        if (loc.x - size < 0 || loc.x + size > width || loc.y + size > height) {
            return true;
        } else {
            return false;
        }
            
    }
    
}
