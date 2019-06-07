int page0 = 0;
String name_0[] = {" schedule", "bus", "timer", "graph"};

void disp0() {
  switch(page0) {
  case 0:
    first();
    break;
  case 1:
    sche();
    break;
  case 2:
    bus();
    break;
  case 3:
    timer();
    break;
  case 4:
    graph();
    break;
  default:
    break;
  }
}

void first() {
  for (int i = 0; i < 2; i ++) {
    for (int j = 0; j < 2; j ++) {
      image(but[i][j], 20+i*230, 50+j*230);
    }
  }
}
