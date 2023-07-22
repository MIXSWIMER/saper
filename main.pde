

int size = 10;
int res = 30;
int tick = 0;
ArrayList<ArrayList<button>> buttons = new ArrayList<ArrayList<button>>();



void setup() {
  size(331, 331, P2D);
  noStroke();
  frameRate(120);
}


void draw() {
  background(140);
  // run only 1 times in the first tick
  if (tick == 0) {
    // init buttons array
    for (int x = 0; x <= size; x++) {
      ArrayList<button> line = new ArrayList<button>();
      for (int y = 0; y <= size; y++) {
        button btn = new button();
        btn.size.set(new PVector(res, res));
        btn.pos.set(new PVector(x*res, y*res));
        btn.text += x + '-' + y;
        btn.colour = color((int)random(100, 255), (int)random(100, 255), (int)random(100, 255));
        line.add(btn);
      }
      buttons.add(line);
    }
  }
  
  for (int x = 0; x < buttons.size(); x++) {
    ArrayList<button> line = buttons.get(x);
    for (int y = 0; y < line.size(); y++) {
      // get button of x and y coordinate
      button btn = line.get(y);
      
      // draw button
      stroke(30);
      fill(btn.colour);
      btn.drawMe();
      
      // action after klick
      btn.checkPressed(0);
      if (btn.isClicked && !mousePressed) {
        
      }
    }
  }

  tick++;
}
