int gseq;//ゲーム画面の切り替えに関する変数
int ex = 100;//星の数
float [] a = new float[ex];//星のx座標を入れる配列
float [] b = new float[ex];//星のy座標を入れる配列
int dx = 100;//ブロックの総数
float [] c = new float [dx];//ブロックのx座標を入れる配列
float [] d = new float [dx];//ブロックのy座標を入れる配列
float [] e = new float [dx];//ブロックの速度を入れる配列
float [] f = new float[dx];
int hp ;//プレイヤーの体力
int score;//得点

void setup() {
  hp = 100;//プレイヤーの体力を１００に初期化
  score = 0;//得点を０に初期化
  size(500, 600, P2D);
  rectMode(CENTER);
  gseq = 0;
  for (int i = 0; i<a.length; i++) {//a,bのi番目の要素にランダムな数を入れる繰り返し文
    a[i]= random(width);
    b[i]= random(height);
  }

  for (int i = 0; i < dx; i++) {//c,d,eのi番目の要素にランダムな数を入れる繰り返し文
    c[i] = random(width);
    d[i] = random(height-1000);
    e[i] = random(3, 7);
    f[i] = random(-10,10);
  }
}

void draw() {//gsqeの値によってゲーム画面を切り替える。
  if (gseq == 0) {
    gameInit();
  } else if (gseq == 1) {
    gamePlay();
  } else {
    gameOver();
  }
}

void gameInit() {//ゲームを起動したらはじめに表示される画面
  background(0);
  drawStar();
  drawText1();
  if (mousePressed == true) {//マウスをクリックしたら、ゲームが始まる
    gseq = 1;
  }
}

void gamePlay() {
  background(0);
  drawStar();
  player();
  block();
  drawText2();
}

void gameOver() {
  background(0);
  drawStar();
  block();
  drawText3();
}
