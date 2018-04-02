class Button
{
  int x, y, xs, ys, textSize;
  color pressed, released;
  PFont font;
  String text;
  boolean isText = false;
  Button(int sx, int sy, int sxs, int sys, color release, color press)
  {
    x = sx;
    y = sy;
    xs = sxs;
    ys = sys;
    pressed = press;
    released = release;
  }
  Button(int sx, int sy, int sxs, int sys, color release, color press,   PFont fonts, String texts, int textSizes)
  {
    x = sx;
    y = sy;
    xs = sxs;
    ys = sys;
    pressed = press;
    released = release;
    font = fonts;
    text = texts;
    textSize = textSizes;
    textFont(font, textSize);
    isText = true;
  }
  boolean overButt()
  {
    if(mouseX > x && mouseX < x + xs &&
        mouseY > y && mouseY < y + ys) 
    {
      return true;
    } 
    else return false;
  }
  void draw()
  {
    if(overButt())
    {
      fill(pressed);
    }
    else
    {
      fill(released);
    }
    rect(x, y, xs, ys);
    /*if(isText)
    {
      fill(0);
      text(text, x + 10, y + 80);
    }*/
  }
}