class Button {
  //Member Variable
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on;

  float txtSize;

  Button(int x, int y, int w, int h, String val, float txtSize) {
    this.x = x - (w/2);
    this.y = y - (h/2);
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(50, 0, 100);
    c2 = color(20, 0, 70);
    on = false;
    this.txtSize = txtSize;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }

    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    fill(200);
  
    textSize(txtSize);
    text(val, x+(w/2), y+(h/2));
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x + w && my > y && my < y + h);
  }
  
  public boolean isHovered(){
    return on;
  }
  
  public void turnOff(){
   on = false; 
  }
}
