class Tree{
    
    
    PVector loc;
    float speed;
    float size;
    
    Tree(int x, int y, float s, float si) {
        loc = new PVector(x, y);
        speed = s;
        size = si;
        
    }
    
    void display() {
        
        push();
        translate(loc.x, loc.y);
        
        fill(110, 83, 65);
        rect(0-size, 0-(2*size), size, 2*size);
        
        fill(81, 115, 85);
        triangle(0-(1.75*size), 0-(1.5*size), 0-(size/2), 0-(4.5*size), size*0.75, 0-(1.5*size));
        
        triangle(0-(1.5*size), 0-(1.5*size)-(1.5*size), 0-(size/2), 0-(3.5*size)-(1.5*size), size*0.5, 0-(1.5*size)-(1.5*size));
        
        triangle(0-(1.20*size), 0-(1.5*size)-(2.75*size), 0-(size/2), 0-(3.5*size)-(2*size), size*0.20, 0-(1.5*size)-(2.75*size));
        
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
