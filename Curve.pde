class Curve {

  float r, theta, x, y, start, colour,t,noiseStart; 
  ArrayList<PVector>path = new ArrayList<PVector>();
  
  Curve(float r_, float colour_) {
    start = r_ *3;
    colour = colour_;
    noiseStart = map(r_,0,100,0,1);
  }

  void move() {
    theta+=0.01;
    t+=0.03;
    float xOff = cos(t) +1;
    float yOff = sin(t) +1;
    r = map(noise(xOff+noiseStart, yOff+noiseStart), 0, 1, start, start+100);

    x = r * cos(theta);
    y = r * sin(theta);

    addPoint(x,y);
  }

  void show() {
    stroke(colour);
    beginShape();
    for (int i = 0; i < path.size(); i++) {
      vertex(path.get(i).x, path.get(i).y);
    }
    endShape();
  }
  
  float getTheta(){
    return theta;
  }
  
  void addPoint(float x_,float y_){
      PVector current = new PVector(x_, y_);
      path.add(current);
  }
}