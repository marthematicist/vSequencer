// Test scene for vSequencer

class Scene00 {
  PGraphics buf;
  Metronome M;
  float xExt;
  float yExt;
  float bgAlpha;
  color bgColor;
  float lineAlpha;
  color lineColor;
  float lineWeight;
  
  Scene00 ( PGraphics bufIn , Metronome MIn, float xExtIn , float yExtIn ) {
    this.buf = bufIn;
    this.M = MIn;
    this.xExt = xExtIn;
    this.yExt = yExtIn;
    this.bgAlpha = 255;
    this.bgColor = color( 0 , 0 , 64 , this.bgAlpha );
    this.lineAlpha = 196;
    this.lineColor = color( 255 , 255 , 255 , this.lineAlpha );
    this.lineWeight = 0.005*yExt;
    this.buf.beginDraw();
    this.buf.background( red(this.bgColor) , green(this.bgColor) , blue(this.bgColor) , 255 );
    this.buf.endDraw();
  }
  
  void draw( int t ) {
    this.buf.beginDraw();
    this.buf.background( this.bgColor );
    this.buf.stroke( this.lineColor );
    this.buf.strokeWeight( this.lineWeight );
    this.buf.noFill();
    
    // draw rings
    float r1 = 0.05*this.yExt;
    float r2 = 0.15*this.yExt;
    float r3 = 0.35*this.yExt;
    float r4 = 0.45*this.yExt;
    float r5 = 0.7*this.yExt;
    this.buf.ellipse( 0.5*this.xExt , 0.5*this.yExt , 2*r1 , 2*r1 );
    this.buf.ellipse( 0.5*this.xExt , 0.5*this.yExt , 2*r2 , 2*r2 );
    this.buf.ellipse( 0.5*this.xExt , 0.5*this.yExt , 2*r3 , 2*r3 );
    this.buf.ellipse( 0.5*this.xExt , 0.5*this.yExt , 2*r4 , 2*r4 );
    this.buf.ellipse( 0.5*this.xExt , 0.5*this.yExt , 2*r5 , 2*r5 );
    
    // draw spokes
    int numSpokes = 32;
    float xc = 0.5*this.xExt;
    float yc = 0.5*this.yExt;
    float dAng = 2*PI / float(numSpokes);
    float bF = this.M.beatFloat( t );
    float offsetAng1 = 4*(bF%1)*dAng;
    float offsetAng2 = 4*(bF%1)*dAng;
    if( bF%1 < 0.25 ) {
      offsetAng1 = 0;
      offsetAng2 = 0;
    }
    if( bF%1 >= 0.5 ) {
      //offsetAng2 = 0;
    }


    color fc = color( 255 , 255 , 255 , 128 );
    for( int i = 0 ; i < numSpokes ; i++ ) {
      float ifl = float(i);
      //if( bF >= 0 && bF < 0.5 || bF >= 2 && bF < 2.5 ) { this.buf.fill( fc ); } else { this.buf.noFill(); }
      this.buf.beginShape();
      this.buf.vertex( xc + r2*cos( ifl*dAng - offsetAng1 ) , yc + r2*sin( ifl*dAng - offsetAng1 ) );
      this.buf.vertex( xc + r1*cos( (ifl+0.5)*dAng - offsetAng1) , yc + r1*sin( (ifl+0.5)*dAng - offsetAng1) );
      this.buf.vertex( xc + r2*cos( (ifl+1)*dAng - offsetAng1) , yc + r2*sin( (ifl+1)*dAng - offsetAng1) );
      this.buf.endShape( CLOSE );
      //if( bF >= 1 && bF < 1.5 || bF >= 3 && bF < 3.5 ) { this.buf.fill( fc ); } else { this.buf.noFill(); }
      this.buf.beginShape();
      this.buf.vertex( xc + r2*cos( ifl*dAng + offsetAng2 ) , yc + r2*sin( ifl*dAng + offsetAng2 ) );
      this.buf.vertex( xc + r3*cos( (ifl+0.5)*dAng + offsetAng2) , yc + r3*sin( (ifl+0.5)*dAng + offsetAng2) );
      this.buf.vertex( xc + r2*cos( (ifl+1)*dAng + offsetAng2) , yc + r2*sin( (ifl+1)*dAng + offsetAng2) );
      this.buf.endShape( CLOSE );
      //if( bF >= 0.5 && bF < 1 || bF >= 2.5 && bF < 3 ) { this.buf.fill( fc ); } else { this.buf.noFill(); }
      this.buf.beginShape();
      this.buf.vertex( xc + r4*cos( ifl*dAng - offsetAng1 ) , yc + r4*sin( ifl*dAng - offsetAng1 ) );
      this.buf.vertex( xc + r3*cos( (ifl+0.5)*dAng - offsetAng1) , yc + r3*sin( (ifl+0.5)*dAng - offsetAng1) );
      this.buf.vertex( xc + r4*cos( (ifl+1)*dAng - offsetAng1) , yc + r4*sin( (ifl+1)*dAng - offsetAng1) );
      this.buf.endShape( CLOSE );
      //if( bF >= 1.5 && bF < 2 || bF >= 3.5 && bF < 4 ) { this.buf.fill( fc ); } else { this.buf.noFill(); }
      this.buf.beginShape();
      this.buf.vertex( xc + r4*cos( ifl*dAng + offsetAng2 ) , yc + r4*sin( ifl*dAng + offsetAng2 ) );
      this.buf.vertex( xc + r5*cos( (ifl+0.5)*dAng + offsetAng2) , yc + r5*sin( (ifl+0.5)*dAng + offsetAng2) );
      this.buf.vertex( xc + r4*cos( (ifl+1)*dAng + offsetAng2) , yc + r4*sin( (ifl+1)*dAng + offsetAng2) );
      this.buf.endShape( CLOSE );
      
    }
    
    
    this.buf.endDraw();
  }
  
}