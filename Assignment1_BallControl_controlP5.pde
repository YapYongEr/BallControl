import controlP5.*;
ControlP5 cp5; //initiate controlp5

ColorPicker cp; // colorpicker

Textarea myTextarea; // forframerate

Println console; //console


float x;
float y;
float easing = 0.05;
int z = 35;
int gray = 150;
boolean line = false;

void setup() {
  size(640, 360); 
  noStroke(); 
  frameRate(90);
  
  cp5 = new ControlP5(this); //picker
  cp = cp5.addColorPicker("picker")
          .setPosition(80, 200)
          .setColorValue(color(0,0,0,0));
          
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10); //showframerate 
  
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(400,250)
                  .setSize(50,100)
                  .setFont(createFont("",11))
                  .setColor(color(50))
                  .setColorBackground(color(150))
                  .setColorForeground(color(100,200));
  ;
  
  console = cp5.addConsole(myTextarea);
}

void draw() { 
  background(200,200,200);
  background(gray); // Mouse events
  background(cp.getColorValue()); //colorchange

  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  float x = mouseX; //Mouse Data
  float y = mouseY; //Mouse Data
  float ix = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
  fill(255, 150); //Mouse Data
  ellipse(x, height/2, y, y); //Mouse Data
  fill(0, 159); //Mouse Data
  ellipse(ix, height/2, iy, iy); //Mouse Data
  
  if (mousePressed == true) //Mouse buttons 
  if (mouseButton == LEFT) { //Mouse buttons
  fill(127,0,0); // Pink
  ellipse(x, y, 66, 66);
    } else if (mouseButton == RIGHT) {
    fill(0); // Black
  } else { 
    fill(255); // Gray
  }
  fill(255,200,200); //Dark red
  ellipse(mouseX, mouseY, 33, 33);
  
  // Rectangle
  if (mouseX < 50) {
    fill(200,0,0,50); //Transparent
    rect(0, 0, 50, 600); // Left
  } else if (mouseX < 640) {
    fill(200,0,0,50); //Transparent
    rect(600, 0, 50, 600); // Right
  }
  
  // Keyboard data
  if (keyPressed == true) { // If the key is pressed,
    line(20, 20, 80, 80); // draw a line
  } else { // Otherwise,
    fill(255,100,100);
    rect(100, 100, 100, 100); // draw a rectangle
    rect(400, 100, 100, 100);
  }
  
  //Coded Keys
  fill(255);
  line(10, 50, 90, 50);
  if (key == CODED) { 
    if (keyCode == UP) {
      z = 20;
    } else if (keyCode == DOWN) {
      z = 50;
    }
  } else {
    z = 35;
  }
  rect(250, y, 100, 30);
  

}

// Mouse Events
void mousePressed() {
  gray += 50;
  rect(mouseX, mouseY, 50, 50);
}

// Key events
void keyPressed() {
  if ((key == 'L') || (key == 'l')) {
    line = true;
  }
}

void keyReleased() {
  line = false;
}

