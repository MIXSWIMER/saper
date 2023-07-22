class button {
  PVector pos = new PVector(0, 0);
  PVector size = new PVector(30, 30);
  String text = "";
  color colour = color(0, 0, 0);
  boolean isClicked = false;
  boolean isChanged = false;


  void checkPressed(int btnId) {
    boolean isHover = (mouseX >= pos.x && mouseX <= size.x+pos.x && mouseY >= pos.y && mouseY <= size.y+pos.y);
    if (isHover && mousePressed && mouseButton == LEFT && btnId == 0) {
      isClicked = true;
      isChanged = true;
    } else if (isHover && mousePressed && mouseButton != LEFT && mouseButton != RIGHT && btnId == 1) {
      isClicked = true;
      isChanged = true;
    } else if (isHover && mousePressed && mouseButton == RIGHT && btnId == 2) {
      isClicked = true;
      isChanged = true;
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
  }
}
