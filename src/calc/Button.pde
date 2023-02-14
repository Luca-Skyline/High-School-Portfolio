class Button {
  //Member Variable
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  PFont font;
  PFont variableFont;

  Button(int x, int y, int w, int h, char val, float txtSize) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(210);
    c2 = color(170);
    on = false;
    font = createFont("Krungthep", txtSize);
    variableFont = createFont("Arial", 10);
  }

  void display(char currentOp) {
    if (on || currentOp == val) {
      fill(c2);
    } else {
      fill(c1);
    }

    quad(x, y-(h/2), x+(w/2), y, x, y+(h/2), x-(w/2), y);
    textAlign(CENTER, CENTER);
    fill(0);

    if (val == '√') {
      textFont(variableFont);
      text("y", x-6, y-6);
      textFont(font);
      text("√", x, y);
      textFont(variableFont);
      text("x", x+7, y+2);
    } else if (val == 'l') {
      textFont(font);
      text("log  (y)", x, y);
      textFont(variableFont);
      text("x", x+2, y+11);
    } else if (val == 'x') {
      textFont(font);
      text("x", x-3, y);
      textFont(variableFont);
      text("y", x+6, y-9);
    } else if (val == 'C') {
      textFont(font);
      text("CLR", x, y-5);
    } else {
      textFont(font);
      text(val, x, y-5);
    }
  }

  void hover(int mx, int my) {
    float a = sqrt(sq(mx-(x))+sq(my-(y-(h/2)))); //distance from point 1 to mouse
    float b = sqrt(sq(mx-(x+(w/2)))+sq(my-(y))); //distance from point 2 to mouse
    float c = sqrt(sq(mx-(x))+sq(my-(y+(h/2)))); //distance from point 3 to mouse
    float d = sqrt(sq(mx-(x-(w/2)))+sq(my-(y))); //distance from point 3 to mouse

    float s1 = (a+b+sqrt(sq((x+(w/2))-(x))+sq(y-(y-(h/2)))))/2; //a, b, and mouse
    float area1 = sqrt(s1*(s1-a)*(s1-b)*(s1-sqrt(sq((x)-(x+(w/2)))+sq(y-(y-(h/2))))));

    float s2 = (b+c+sqrt(sq((x)-(x+(w/2)))+sq((y+(h/2))-y)))/2; //b, c, and mouse
    float area2 = sqrt(s2*(s2-b)*(s2-c)*(s2-sqrt(sq((x)-(x+(w/2)))+sq((y+(h/2))-y))));

    float s3 = (c+d+sqrt(sq((x-(w/2))-(x))+sq((y)-(y+(h/2)))))/2; //c, d, and mouse
    float area3 = sqrt(s3*(s3-c)*(s3-d)*(s3-sqrt(sq((x-(w/2))-(x))+sq((y)-(y+(h/2))))));

    float s4 = (d+a+sqrt(sq((x-(w/2))-(x))+sq((y)-(y-(h/2)))))/2; //a, d, and mouse
    float area4 = sqrt(s4*(s4-a)*(s4-d)*(s4-sqrt(sq((x-(w/2))-(x))+sq((y)-(y-(h/2))))));

    on = ((area1 + area2 + area3 + area4) <= (h*w/2)+2);
  }
}
