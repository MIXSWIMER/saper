class button {
  PVector pos = new PVector(0, 0);
  PVector size = new PVector(30, 30);
  String text = "";
  int[] colour = {0, 0, 0};
  boolean isClicked = false;
  boolean isChanged = false;
  String but = "L";



  void checkPressed(int btnId) {
    boolean isHover = (mouseX >= pos.x && mouseX <= size.x+pos.x && mouseY >= pos.y && mouseY <= size.y+pos.y);
    if (isHover && mousePressed && mouseButton == LEFT) {
      isClicked = true;
      isChanged = true;
      but = "L";
    } else if (isHover && mousePressed && mouseButton != LEFT && mouseButton != RIGHT) {
      isClicked = true;
      isChanged = true;
      but = "M";
    } else if (isHover && mousePressed && mouseButton == RIGHT) {
      isClicked = true;
      isChanged = true;
      but = "R";
    } else {
      if (isChanged && !mousePressed) {
        isChanged = false;
      } else {
        isClicked = false;
      }
    }
  }


  void drawMe() {
    rect(pos.x, pos.y, size.x, size.y);
    textSize(16);
    fill(255);
    text(text, pos.x+size.x/2-5, pos.y+size.y-10);
  }
}
