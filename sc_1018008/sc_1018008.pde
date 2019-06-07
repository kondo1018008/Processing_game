int page = 0;
//String b_name[] = {"Home","Weather", "Calender", "News", "Back"}; // labels of button
String baseURL = "http://weather.livedoor.com/forecast/webservice/json/v1?city=";
String city = "017010";
String title;
JSONArray forecasts;
PImage bgImg;
PImage hImg, bImg, wImg, cImg, nImg, kouji;
PImage [] []but = new PImage [2] [2];
PImage[][] num = new PImage[2] [2];
String url = "http://feeds.feedburner.com/hatena/b/hotentry";
XML[] items;
float y;
final int daysOfMonth[]={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
String [] bus1;


void setup() {
  size(480, 640);
  JSONObject w = loadJSONObject(baseURL + city);
  title = w.getString("title");
  forecasts = w.getJSONArray("forecasts");
  loadImage();
  fill(255);
  XML xml = loadXML(url);
  items = xml.getChildren("item");
  y = 20;
}

void mouseClicked() {
  if (mouseY > height-width/5 && mouseY < height) { 
    if (mouseX < width/5) {
      push(page);
      page = 0;
    } else if (mouseX < width*2/5) { // the left most button 
      push(page); // push page number to stack
      page = 1; // current page will be changed to 1
    } else if (mouseX < width*3/5) {
      push(page); // push page number to stack
      page = 2; // current page will be changed to 2
    } else if (mouseX < width*4/5) {
      push(page); // push page number to stack
      page = 3; // current page will be changed to 3
    } else {
      page = pop(); // pop page number from stack
    }
  }
  show_stack();

  if (page == 0&&page0 == 0) {
    if (mouseY >50 && mouseY <250 ) { 
      if (mouseX >20 && mouseX < 220) {
        push0(page0);
        page0 = 1;
      } else if (mouseX >250 && mouseX < 450) { // the left most button 
        push0(page0); // push page number to stack
        page0 = 2; // current page will be changed to 1
      }
    } else if (mouseY>280 && mouseY < 480) {
      if (mouseX >20 && mouseX < 220) {
        push0(page0); // push page number to stack
        page0 = 3; // current page will be changed to 2
      } else if (mouseX >250 && mouseX < 450) {
        push0(page0); // push page number to stack
        page0 = 4; // current page will be changed to 3
      }
    }
    show0_stack();
  } else if (mouseY > height-width/5 && mouseY < height&&mouseX > width*4/5&&page == 0) {
    page0 = pop0();
  }
}

void draw() {
  background(127);
  image(bgImg, 0, 0);
  /* show buttons */
  for (int i = 0; i < 5; i++) {
    fill(127);
    rect(width*i/5, height-width/5, width/5, width/5, 30);
    fill(255);
  }


  /* show page */
  switch(page) {
  case 0:
    disp0();
    break;
  case 1:
    disp1();
    break;
  case 2:
    disp2();
    break;
  case 3:
    disp3();
    break;
  default:
    break;
  }
  image(hImg, 0, height-width/5);
  image(wImg, width/5, height-width/5);
  image(cImg, width*2/5, height-width/5);
  image(nImg, width*3/5, height-width/5);
  image(bImg, width*4/5, height-width/5);
  text(now(), 200, 20);
}
