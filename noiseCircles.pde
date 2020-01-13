void setup() {
  fullScreen();

  for (int i = 0; i < total; i++) {
    float colour =(int) map(i, 0, total, 31, 255);
    curves.add(new Curve(i, colour));
  }
}

ArrayList<Curve>curves = new ArrayList<Curve>();
int total = 100;
int count = 0;

void draw() {
  background(20);
  translate(width/2, height/2);
  stroke(255);
  noFill();

  for (int i = 0; i < curves.size(); i++) {
    float angle = curves.get(i).getTheta();

    if (angle < TWO_PI) {
      curves.get(i).move();
    }

    if (angle >= TWO_PI) {
      count++;
      if (count==1) {
        saveFrame("output/firstDraft.png");
      }
    }

    curves.get(i).show();
  }
}