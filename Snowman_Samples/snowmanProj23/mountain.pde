class Mountain {
    
    PVector loc;
    float speed;
    float base;
    float tall;
    int level; //background or foreground mountains
    
    Mountain(int x, int y, float s, float b, float h, int l) {
        loc = new PVector(x, y);
        speed = s;
        
        base = b;
        tall = h;
        
        level = l;
    }
    
    void display() {
        switch(level) {
            
            case 1:
                fill(#AFD8F7);
                break;
            case 2:
                fill(#7DB9E5);
                break;
            case 3:
                fill(#65B0E8);
                break;
            
        }
        triangle(loc.x, loc.y, loc.x + (base/2), height-tall, loc.x + base, loc.y);
        
    }
    
    
    void update() {
        loc.x -= speed;
    }
    
    boolean end() {
        if (loc.x + base < 0) {
            return true;
        } else {
            return false;
        }
    }
    
}
