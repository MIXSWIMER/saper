

int size = 10;
int res = 30;
int tick = 0;
ArrayList<ArrayList<button>> buttons = new ArrayList<ArrayList<button>>();
boolean[][] mines = new boolean[size][size];


void setup() {
  size(301, 301, P2D);
  noStroke();
  frameRate(120);
}


void draw() {
  background(140);
  // run only 1 times in the first tick
  if (tick == 0) {
    // init mines array
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        mines[x][y] = false;
      }
    }

    mines[1][1] = true;
    mines[4][1] = true;
    mines[5][4] = true;
    mines[2][5] = true;
    mines[6][6] = true;
    mines[0][7] = true;
    mines[0][8] = true;
    mines[5][8] = true;
    mines[0][9] = true;
    mines[2][9] = true;




    // init buttons array
    for (int x = 0; x < size; x++) {
      ArrayList<button> line = new ArrayList<button>();
      for (int y = 0; y < size; y++) {
        button btn = new button();
        btn.size.set(new PVector(res, res));
        btn.pos.set(new PVector(x*res, y*res));
        btn.colour = color(127, 127, 127);
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
        //check mines count
        if (mines[x][y]) {
        } else {
          int minesCount = 0;
          for (int dx = -1; dx < 2; dx++) {
            for (int dy = -1; dy < 2; dy++) {
              if (x+dx > -1 && x+dx < size && y+dy > -1 && y+dy < size) {
                if (mines[x+dx][y+dy]) minesCount++;
              }
            }
          }
          if (minesCount != 0) btn.text = str(minesCount);
        }
      }
    }
  }

  tick++;
}
