/*String [] [] bus11= new String [bus1.length][4];*/
void bus() {
  stroke(255);
  fill(255);
  for (int i = 0; i < 5; i ++) {
    line(20+i*110, 60, 20+i*110, 500);
  }
  for (int i = 0; i < 12; i++) {
    line(20, 60+40*i, 460, 60+40*i);
  }
  text("乗り場", 50, 80);
  text("出発時刻", 160, 80);
  text("経由", 270, 80);
  text("目的地", 380, 80);
  for (int i = 0; i < bus1.length; i++) {
    // bus11[i] = spl(bus1[i]);
    //for(int j = 0 ; j < 4 ; j ++){
    // text(bus11[i][j],50+110*j,120+40*i);
    //}
    text(bus1[i], 30, 120+40*i);
  }
}

/*String [] spl(String s){
 String [] data ;
 data = split(s,",");
 return data;
 }*/
