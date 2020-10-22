class Snowball {
    
    PVector loc;
    PVector vel;
    PVector acc;
    int r;
    
    Snowball(float x, float y) {
        
        loc = new PVector(x, y);
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        
        r = 20;
    }
    
    void applyForce(PVector force) {
        acc.add(force);
    }
    
    void update() {
        vel.add(acc);
        loc.add(vel);
        
        acc.setMag(0);
    }
    
    void display() {
        noStroke();
        fill(255);
        ellipse(loc.x, loc.y, 2*r, 2*r);
    }
    
    boolean touchingEdges() {
        if (loc.x - r < 0 || loc.x + r > width || loc.y - r < 0 || loc.y + r > height) {
            return true;
        } else {
            return false;
        }
            
    }
    
    boolean touching(Tree t) {


        if (dist(loc.x, loc.y, t.loc.x - t.size/2, height - 4.25*t.size) < r+t.size || dist(loc.x, loc.y, t.loc.x - t.size/2, height - 3*t.size) < r+t.size || dist(loc.x, loc.y, t.loc.x - t.size/2, height - 1.5*t.size) < r+t.size) {
            return true;
        } else {
            return false;
        }
    }
   
   
    boolean touching(House h) {
        if (dist(loc.x, loc.y, h.loc.x - (h.size/2), height - (h.size/2)) < r + h.size || dist(loc.x, loc.y, h.loc.x - (h.size/2), height - h.size) < r + h.size) {
            return true;
        } else {
            return false;
        }
    }
    
}
