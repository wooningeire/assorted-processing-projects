void setup() {
    size(400, 616);
    frameRate(60);
    background(0, 0);
    noSmooth();
}

float startX = 200;
float startY = 150;
float endX = 200;
float endY = 466;

float startRed = 207;
float startGreen = 255;
float startBlue = 255;
float endRed = 255;
float endGreen = 255;
float endBlue = 207;

float w = 100;
float h = 100;

float easeInOut(int rawT, int maxT, float degree) {
    float t = (float)rawT / (float)maxT;
    return t < .5 ? pow(2, degree - 1) * pow(t, degree) : pow(-2, degree - 1) * pow(t - 1, degree) + 1;
}

float easeIn(int rawT, int maxT, float degree) {
    float t = (float)rawT / (float)maxT;
    return pow(t, degree);
}

float easeOut(int rawT, int maxT, float degree) {
    float t = (float)rawT / (float)maxT;
    return pow(-1, degree - 1) * pow(t - 1, degree) + 1;
}

float cosine(float angle) {
    return sqrt(.5) * cos(PI * angle + 3 * PI / 4) + .5;
}

float sine(float angle) {
    return -sqrt(.5) * sin(PI * angle + 3 * PI / 4) + .5;
}

void draw() {
    clear();
    
    if (frameCount >= 0 && frameCount < 30) {
        float c0 = easeOut(frameCount, 30, 2);
        float c1 = easeOut(frameCount, 30, 3);
        
        fill(startRed, startGreen, startBlue);

        quad(
            startX + c0 * (-w / 2 + cosine(c1) * w), startY + c0 * (-h / 2 +   sine(c1) * h),
            startX + c0 * ( w / 2 -   sine(c1) * w), startY + c0 * (-h / 2 + cosine(c1) * h),
            startX + c0 * ( w / 2 - cosine(c1) * w), startY + c0 * ( h / 2 -   sine(c1) * h),
            startX + c0 * (-w / 2 +   sine(c1) * w), startY + c0 * ( h / 2 - cosine(c1) * h)
        );
    }
    
    else if (frameCount >= 30 && frameCount < 90) {
        float rectCenterX = easeInOut(frameCount - 30, 60, 4) * (endX - startX) + startX;
        float rectCenterY = easeInOut(frameCount - 30, 60, 4) * (endY - startY) + startY;
        
        quad(
            rectCenterX - w / 2, rectCenterY - h / 2,
            rectCenterX + w / 2, rectCenterY - h / 2,
            rectCenterX + w / 2, rectCenterY + h / 2,
            rectCenterX - w / 2, rectCenterY + h / 2
        );
        
        float blue = easeInOut(frameCount - 30, 60, 4) * (endBlue - startBlue) + startBlue;
        float green = easeInOut(frameCount - 30, 60, 4) * (endGreen - startGreen) + startGreen;
        float red = easeInOut(frameCount - 30, 60, 4) * (endRed - startRed) + startRed;
        fill(red, green, blue);
    }
    
    else if (frameCount >= 90 && frameCount < 120) {
        float c0 = 1 - easeIn(frameCount - 90, 30, 2);
        float c1 = 1 - easeIn(frameCount - 90, 30, 3);

        quad(
            endX + c0 * (-w / 2 + cosine(-c1) * w), endY + c0 * (-h / 2 +   sine(-c1) * h),
            endX + c0 * ( w / 2 -   sine(-c1) * w), endY + c0 * (-h / 2 + cosine(-c1) * h),
            endX + c0 * ( w / 2 - cosine(-c1) * w), endY + c0 * ( h / 2 -   sine(-c1) * h),
            endX + c0 * (-w / 2 +   sine(-c1) * w), endY + c0 * ( h / 2 - cosine(-c1) * h)
        );
    }
    
    else {
        int loweredChannel = floor(random(3)); println(loweredChannel);
        endRed = loweredChannel == 0 ? 207 : 255;
        endGreen = loweredChannel == 1 ? 207 : 255;
        endBlue = loweredChannel == 2 ? 207 : 255;
        frameCount = 0;//exit();
    }
    
    //PImage image0 = get(0, 0, 400, 300);
    //PImage image1 = get(0, 316, 400, 300);
    
    //String fileN = String.format("%03d", frameCount);
    
    //image0.save("frames/0-" + fileN + ".png");
    //image1.save("frames/1-" + fileN + ".png");
}
