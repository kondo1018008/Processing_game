/* show page 2 */
void disp2() {
  fill(128, 255, 128);
  text("Calender", 20, 60);
  fill(255);
  drawCalender(year(), month(), day());
}

int zeller(int y, int m, int d) {
  int h;
  if (m<3) {
    m+=12;
    y--;
  }
  h=(d+(m+1)*26/10+(y%100)+(y%100)/4+y/400-2*y/100)%7;
  h-=1;
  if (h<0) h+=7;
  return h;
}

boolean isLeapYear(int y) {
  if (y%400==0) {
    return true;
  } else if (y%100==0) {
    return false;
  } else if (y%4==0) {
    return true;
  }
  return false;
}

int getDaysOfMonth( int y, int m) {
  int days=daysOfMonth[m-1];
  if (m==2 && isLeapYear(y)) {
    days++;
  }
  return days;
}

void drawCalender(int y, int m, int d) {
  int week=zeller(y, m, 1); // 「今月」1日の曜日を求める
  int days=getDaysOfMonth(y, m); // 「今月」の日数を求める
  fill(0, 255, 0); // 年/月を緑で表示
  text(y+"/"+m, 10, (height-5)/6);
  for (int i=1; i<=days; i++) {
    if (i==d) {// 「今日」なら青字
      fill(0, 0, 255);
    } else {// 「今日」でないなら字
      fill(255);
      if ((i+week-1)%7==0) { // 日曜は赤字
        fill(255, 0, 0);
      }
    }
    String dd=(" "+i);
    dd=dd.substring(dd.length()-2);//文字列を右寄せっぽくする
    text(dd, (i+week)%7*((width-10)/7)+20, ((i+week)/7+2)*((height-5)/8));
  }
}
