void player() {//プレイヤーの描写をする関数
  stroke(255, 0, 0);
  fill(255, 0, 0);
  triangle(mouseX, mouseY-10, mouseX+10, mouseY+10, mouseX-10, mouseY+10);
  triangle(mouseX, mouseY-20, mouseX-5, mouseY-10, mouseX+5, mouseY-10);
  fill(255);
  rect(mouseX, mouseY, 10, 20, 30);
}
/*
自機の描写については、上記の通りである。
 自機の描写や、自機とブロックの当たり判定については
 全てシステム変数を使っているので、
 変数のスコープなどにとらわれることが無く、
 また、可読性も高い、と自分は思っている…
 */

void drawStar() {//背景の星を描写する関数
  for (int i = 0; i<ex; i++) {
    stroke(255);
    point(a[i], b[i]);
    b[i] = b[i]+7;
    if (b[i]>height) {
      b[i] = b[i]-height;
    }
  }
}
/*
 setup関数の中で決めた値を用いて、
 繰り返し星を描写している。
 */

void block() {//ブロックの表示と、ブロックに関わる関数を一つにまとめた関数
  for (int i = 0; i < dx; i++ ) {
    noStroke();
    fill(c[i]*255/width, d[i]*255/height, e[i]*255/7);
    rect(c[i], d[i], 20, 20);
   if(f[i]>0){
      f[i]=f[i]-3;
    }else{
      f[i]=f[i]+3;
    }
    c[i] = c[i]+f[i];
    scorePlus(i);
    blockRedraw(i);
  }
}

void drawText1() {//スタート画面に文字を表示する関数
  textAlign(CENTER, CENTER);
  textSize(45);
  fill(255, 255, 0);
  text("Avoid space block", width/2, height/2);
  fill(255);
  textSize(30);
  text("Click!", width/2, height-100);
}
/*
テキストを表示するときの座標の基準を
 真ん中に持ってくることによって
 位置合わせが楽になる
 */

void drawText2() {//プレイ画面に文字を表示する関数
  for (int i = 0; i < dx; i++) {
    blockHitCheck(i);
    fill(255);
    if (d[i] > height) {
      score = score + 1;
    }
    text("HP:"+hp, 100, 580);
    text("score:"+score, 110, 25);
    if (hp <= 0) {
      gseq = 2;
    }
  }
}
/*
スコアの加算や、gseqの値を変える操作も
 この関数で行なっている
 */

void scorePlus(int i) {//スコアの値によってゲームの難易度を変える関数
  if (score<10000) {
    dx = 30;
    d[i] = d[i] + e[i];
  } else if (score<25000) {
    dx = 40;
    d[i] = d[i] + e[i]*3/2;
  } else if (score<50000) {
    dx = 45;
    d[i] = d[i] + e[i]*2;
  } else {
    dx = 50;
    d[i] = d[i] + e[i]*5/2;
  }
}
/*
今設定されているこの値だと、
 かなり難し目である。
 */

void blockHitCheck(int i) {//ブロックと自機との当たり判定をする関数
  if ((mouseY +5> d[i]-10)&&(mouseY -5< d[i] + 10)&&(mouseX +5> c[i]-10)&&(mouseX -5< c[i]+10)) {
    hp = hp - 1;
  }
}

void blockRedraw(int i) {//ブロックを再描写する関数
  if ((e[i] <5)&&(d[i] > height)) {
    d[i] = 0;
  } else if ((e[i]>4)&&(d[i] > 1000)) {
    d[i] = 0;
  }
  
  if(c[i]>=width+20){
      c[i] = 0;
    }else if(c[i] <=-20){
      c[i] = width;
    }
}
/*
ブロックのy座標が画面サイズより大きい、
 １０００を超えないと再描写されないのは、
 あまりにも早く描写されると難易度が上がりすぎてしまうというのと、
 速い球を避けたときの得点は大きく、遅い球を避けたときの得点は小さくするため
 というのが主な理由である。
 */

void drawText3() {//ゲームオーバー画面に文字を表示する関数
  fill(255, 0, 0);
  text("GAME OVER", width/2, height/2);
  fill(255);
  text("YOUR SCORE :"+score, width/2, height/2-100);
  text("CLICK TO RETRY!!", width/2, height/2 +100);
  if (mousePressed == true) {
    gseq = 1;
    score = 0;
    hp = 100;
  }
}
/*
mouseをクリックすることによって再チャレンジすることができる。
 */
