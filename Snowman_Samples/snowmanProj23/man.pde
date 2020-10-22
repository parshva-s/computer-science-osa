class Snowman {

    // Vectors for position, velocity and acceleration

    PVector loc;
    PVector vel;
    PVector acc;

    int r;

    Snowman(int x, int y) {
        loc = new PVector(x, y);
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);

        r = 50;
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
        
        // body
        fill(255);
        ellipse(loc.x, loc.y, 2*r, 2*r);
        ellipse(loc.x, loc.y-(2*r)+r/2, (2*r)/1.2, (2*r)/1.2);
        ellipse(loc.x, (loc.y-(4*r))+1.3*r, (2*r)/1.5, (2*r)/1.5);
        
        
        //hat
        fill(30);
        rect(loc.x - r*0.75, loc.y - (2.7*r + r*0.75), r*1.5, r/3);
        rect(loc.x - r*0.4, loc.y - (2.7*r + r*1.75), r*0.8, r*1.1);
        
        fill(207, 116, 116);
        rect(loc.x - r*0.4, loc.y - (2.7*r + r*1), r*0.8, r/4);
        
        //eyes
        fill(30);
        ellipse(loc.x - r/3, loc.y - (2.7*r + r*0.1), r/5, r/5);
        ellipse(loc.x + r/3, loc.y - (2.7*r + r*0.1), r/5, r/5);
        
        //nose
        fill(249, 178, 56);
        triangle(loc.x, loc.y - (2.7*r + r/8), loc.x, loc.y - (2.7*r - r/8), loc.x + r*0.6, loc.y - (2.7*r));
        
        //bowtie - Represents me because sometimes I like to feel fancy and wear ties. ;)
        fill(207, 116, 116);
        triangle(loc.x, loc.y - (2*r), loc.x + r/3, loc.y - (2.2*r), loc.x + r/3, loc.y - (1.8*r) );
        triangle(loc.x, loc.y - (2*r), loc.x - r/3, loc.y - (2.2*r), loc.x - r/3, loc.y - (1.8*r) );
    }

    void edges() {
        if (loc.x - r < 0) {
            vel.x *= -0.5;
            loc.x = 0 + r;
        }

        if (loc.x + r > width) {
            vel.x *= -0.5;
            loc.x = width - r;
        }

        if (loc.y - r < 0) {
            vel.y *= -0.5;
            loc.y = 0 + r;
        }

        if (loc.y + r > height) {
            vel.y *= 0;
            loc.y = height - r;
        }
    }

    boolean touching(Tree t) {
        //println(dist(loc.x, loc.y, t.loc.x + t.size/2, 4.25*t.size));

        /*
        strokeWeight(10);
         
         fill(0, 0, 255);
         ellipse(loc.x, loc.y, 10, 10);
         
         fill(255, 0, 0);
         ellipse(t.loc.x - t.size/2, height - 4.25*t.size, 10, 10);
         
         ellipse(t.loc.x - t.size/2, height - 3*t.size, 10, 10);
         
         ellipse(t.loc.x - t.size/2, height - 1.5*t.size, 10, 10);
         */


        if (dist(loc.x, loc.y, t.loc.x - t.size/2, height - 4.25*t.size) < r+t.size || dist(loc.x, loc.y, t.loc.x - t.size/2, height - 3*t.size) < r+t.size || dist(loc.x, loc.y, t.loc.x - t.size/2, height - 1.5*t.size) < r+t.size) {
            return true;
        } else {
            return false;
        }
    }

    boolean touching(Snowflake s) {

        /*
        fill(255, 0, 0);
         ellipse(loc.x, loc.y, 10, 10);
         ellipse(loc.x, loc.y-(1.5*r), 10, 10);
         ellipse(loc.x, loc.y-(2.7*r), 10, 10);
         */

        if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < r || dist(loc.x, loc.y-(1.5*r), s.loc.x, s.loc.y) < r || dist(loc.x, loc.y-(2.7*r), s.loc.x, s.loc.y) < r) {
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
