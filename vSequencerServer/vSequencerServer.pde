
import processing.net.*;

Server s;
Client c;
String input;
int data[];

float xRes = 800;
float yRes = 600;


void setup() {
  size( 800 , 600 );
  buf = createGraphics( 800 , 600 );
  
  M = new Metronome();
  
  s = new Server(this, 12345); 
}

void draw() {
  
  c = s.available();
  if (c != null) {
    
    input = c.readString(); 
      input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
      data = int(split(input, ' '));  // Split values into an array
      if( data[0] == 1 ) {
        float ml = float( data[1] ) + float( data[2] )*0.001; 
        M.measureLength = ml;
        M.sync( millis() );
        if( M.measureLength > 0 ) { 
          M.beatEstablished = true;
        }
      }
  }
  
  
  M.evolve();
  
  
  buf.beginDraw();
  buf.background( bgColor );
  buf.stroke( blockBorderColor );
  buf.strokeWeight( 4 );
  
  if( beatTriggered ) {
    beatTriggered = false;
    buf.fill( beatColor );
    buf.ellipse( xRes*0.5 , yRes*0.125 , yRes* 0.125 , yRes*0.125 );
  
    if( M.beat == 0 ) {
      //blockTriggered0 = false;
      buf.fill( blockColor0 );
      buf.ellipse( xRes*.1250 , yRes*0.5 ,  xRes*0.25 , xRes*0.25 );
    }
    if( M.beat == 1 ) {
      //blockTriggered1 = false;
      buf.fill( blockColor1 );
      buf.ellipse( xRes*0.375 , yRes*0.5 ,  xRes*0.25 , xRes*0.25 );
    }
    if( M.beat == 2 ) {
      //blockTriggered2 = false;
      buf.fill( blockColor2 );
      buf.ellipse( xRes*0.625 , yRes*0.5 ,  xRes*0.25 , xRes*0.25 );
    }
    if( M.beat == 3 ) {
      //blockTriggered3 = false;
      buf.fill( blockColor3 );
      buf.ellipse( xRes*0.875 , yRes*0.5 ,  xRes*0.25 , xRes*0.25 );
    }
  }
  buf.ellipse( mouseX , mouseY , 10 , 10 );
  buf.endDraw();
  image( buf , 0 , 0 );
  
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