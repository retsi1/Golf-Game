//----------------------------------------
//             GOLF GAME
//----------------------------------------
float xpos = width/2;
float ypos = 800;
float xspeed = 2.8;
float yspeed = 2.8;
int xdirection = 1;
int ydirection = 1;
int green = 255;
float gravity = 0.001;  
float xhole = random(50, 1230);
float yhole = random(50, 650);

void setup() {
  size(1280, 960);
  ellipseMode(RADIUS);
  rectMode(SQUARE);
}

void playField(){
  for (int y = 0; y < 700; y = y + 39) {
    for (int x = 0; x < width; x = x + 40) {
      stroke(0);
      rect (x, y, width, 700);
      fill (0, random(100,255), 0);
    }
  }
  fill (0);
  ellipse ( xhole, yhole, 30, 30); // Hole
}

void draw() {
  noStroke();
  fill (0, 255, 0);
  background (100);
  playField();


// Launchzone
  fill (255, green, 25);
  triangle (xpos-25, 800, xpos+25, 720, xpos+75, 800); //Triangle top on arrow
  rect(xpos, 800, xpos+50, 950);  //Rectangle base for arrow
  launchMode();

  fill(255, 255, 255);
  ellipse(xpos+25, ypos, 23, 23);

  ypos = ypos + ( yspeed * ydirection ); // Update the position of the arrow
  if (ypos > height || ypos < 25) {   // If the arrow hits the window border, reverse its direction
    ydirection *= -1;
    //yspeed *= 0.95;  //friction
  }
  xpos = xpos + ( xspeed * xdirection ); // Update the position of the arrow  
  if (xpos > width-75 || xpos < 25) {   // If the arrow hits the window border, reverse its direction
    xdirection *= -1;
  }
}

//------  MOUSE PRESSED & RELEASED  -------
void launchMode() {
  if (mousePressed == true) {
    green-=1.0625;  //Because 255/60/4 = 1.0625 therefore duration = 4 seconds exactly
    xspeed = 0;
  }
}

void mouseReleased() {
  green=255;
  xspeed =2.8;
  fill (255, 255, 25);
}
