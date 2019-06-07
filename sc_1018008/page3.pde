/* show page 3 */
void disp3() {
  fill(128, 128, 255);
  text("News", 20, 60);
  pushMatrix();
  translate(0, 60);
  fill(255);
  for (int i = 0; i < items.length; i++) {
    String title = items[i].getChild("title").getContent();
    String subject = items[i].getChild("dc:subject").getContent();
    text((i + 1) + ":[" + subject + "] " + title, 10, y + 40 * i);
  }
  popMatrix();
}

void mouseDragged() { // Scroll the list by dragging 
  y += mouseY - pmouseY;
}
