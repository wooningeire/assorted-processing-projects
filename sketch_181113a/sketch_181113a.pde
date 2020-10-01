void setup() {
    size(400, 400);
    frameRate(24);
    fill(0, 0, 0);
}

float x = 0;
int dim = 400;
float phaseShift = 200;

void draw() {
    float y = 100 * sin((x - phaseShift) / 40) + 200;
    
    ellipse(x, y, 2, 2);
    
    x++;
    if (x > dim) {
        x %= dim;
        
        phaseShift = random(400);
        
        float[] rgb = {random(255), random(255), random(255)};
        fill(rgb[0], rgb[1], rgb[2]);
        stroke(rgb[0], rgb[1], rgb[2]);
    }
    
    try {
        java.util.concurrent.TimeUnit.MILLISECONDS.sleep(5);
    } catch (Exception error) {
        return;
    }
    
    saveFrame("frames/######.png");
}
