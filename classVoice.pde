///////////////////////////////////////////
// CLASS: Voice                          //
///////////////////////////////////////////

class Voice {
  // fields ///////////////////////////////
  PGraphics pg;           // drawing buffer
  
  void draw() {
    this.pg.beginDraw();
    this.pg.ellipse( xRes*0.5 , yRes*0.5 , 100 , 100 );
    this.pg.endDraw();
  }
}

// subclasses of Voice must have a setup() and draw() method

class Voice01 extends Voice {
  Voice01( PGraphics pgIn ) {
    this.pg = pgIn;
  }
  void draw() {
    this.pg.beginDraw();
    this.pg.ellipse( xRes*0.5 , yRes*0.5 , mouseX , mouseX );
    this.pg.endDraw();
  }
  
}