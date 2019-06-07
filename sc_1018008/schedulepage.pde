String [] two = {"2"};
String []  four= {"4"};
String [] six = {"6"};
String [] eait = {"8"};
void sche() {
  text("今週の目標勉強時間", 20, 50);
  for (int i = 0; i < 2; i ++) {
    for (int j = 0; j < 2; j ++) {
      rect( 20+i*230, 50+j*230, 210, 210);
    }
  }
  for (int i = 0; i < 2; i ++) {
    for (int j = 0; j < 2; j ++) {
      image(num[i][j], 20+i*230, 50+j*230);
    }
  }
  if (mouseY >50 && mouseY <250 &&mousePressed==true) { 
    if (mouseX >20 && mouseX < 220) {
      saveStrings("study.txt", two);
    } else if (mouseX >250 && mouseX < 450) { // the left most button 
      saveStrings("study.txt", six);
    }
  } else if (mouseY>280 && mouseY < 480&&mousePressed == true) {
    if (mouseX >20 && mouseX < 220) {
      saveStrings("study.txt", four);
    } else if (mouseX >250 && mouseX < 450) {
      saveStrings("study.txt", eait);
    }
  }
}
