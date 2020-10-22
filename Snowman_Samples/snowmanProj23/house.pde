class House{
    
    
    PVector loc;
    float speed;
    float size;
    
    House(int x, int y, float s, float si) {
        loc = new PVector(x, y);
        speed = s;
        size = si;
        
    }
    
    void display() {
        
        push();
        translate(loc.x, loc.y);
        
        fill(112, 80, 55);
        rect(0-size, 0-size, size, size);
        triangle(0-(1.25*size), 0-(size*0.9), 0-(0.5*size), 0-(1.5*size), 0.25*size, 0-(size*0.9));
        
        pop();
        
        
    }
    
    void update() {
        loc.x -= speed;
    }
    
    boolean end() {
        if (loc.x < 0) {
            return true;
        } else {
            return false;
        }
    }
    
}
