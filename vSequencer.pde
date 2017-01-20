//import processing.net.*;

//Client c;
//String input;
//int data[];

float xRes;
float yRes;

Voice[] V;

void setup() {
  size( 800 , 600 );
  drawBuffer = createGraphics( 800 , 600 );
  xRes = float(width);
  yRes = float(height);
  
  M = new Metronome();
  S00 = new Scene00( drawBuffer, M , xRes , yRes );
  // c = new Client( this, "192.168.0.104", 12345 );
  
  V = new Voice[3];
  V[0] = new Voice01( drawBuffer );
}

void draw() {
  // get the current time
  int t = millis();
  // evolve the metronome
  M.evolve( t );
  
  S00.draw( t );
  V[0].draw();
  
  image( drawBuffer , 0 , 0 );
  
  M.draw();
  
}




void keyPressed() {
  int t = millis();
  if (key == 'a') {
    blockTriggered0 = true;
  }
  if (key == 's') {
    blockTriggered1 = true;
  }
  if (key == 'd') {
    blockTriggered2 = true;
  }
  if (key == 'f') {
    blockTriggered3 = true;
  }
  if (key == 'b') {
    M.triggerInput( t );
    M.sync( t );
  }
  if (key == 'n') {
    M.triggerInput( t );
    M.sync( t );
  }
  if (key == 'g') {
    M.reset();
  }
}
void keyReleased() {
  if (key == 'a') {
    blockTriggered0 = false;
  }
  if (key == 's') {
    blockTriggered1 = false;
  }
  if (key == 'd') {
    blockTriggered2 = false;
  }
  if (key == 'f') {
    blockTriggered3 = false;
  }
}