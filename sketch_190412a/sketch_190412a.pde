int depth = 0;

void drawShape(float llx, float lly, float len, int depth) {
    if (depth == 0) {
        fill(random(256), random(256), random(256));
        
        triangle(llx, lly, llx+len, lly, llx + len/2, lly - len * sqrt(3)/2);
        
    } else if (depth > 0) {
        drawShape(llx,lly,len/2,depth-1);
        drawShape(llx+len/2,lly,len/2,depth-1);
        drawShape(llx+len/4,lly-(len/2)*sqrt(3)/2,
                       len/2,depth-1);
    }    
}

void setup() {
    size(800, 700);
    noStroke();
    
    frameRate(1);
}

void draw() {
    if (depth >= 12) stop();
    
    drawShape(50, 625, 700, depth);
    depth++;
}
