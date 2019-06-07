int page0_index = 0; // this index shows next array element to save data 
int page0_stack[] = new int[10]; // save pages in this array

void push0(int p) {
  if (page0_index > 9) return; // if stack over flows, do nothing

  page0_stack[page0_index] = page0; // store current data to the stack
  ++page0_index; // increments index
}

int pop0() {
  if (page0_index > 0) {
    page0_index--;
  }
  return page0_stack[page0_index];
}

void show0_stack() {
  // for monitoring the contents of page_stack[]
  print("history of visited pages0 (current is not included): ");
  for (int i = 0; i < page0_index; i++) {
    print(page0_stack[i]+" ");
  }
  println();
}
void mouseClicked0() {
  if (page == 0) {
    if (mouseY >50 && mouseY <250 ) { 
      if (mouseX >20 && mouseX < 220) {
        push0(page0);
        page0 = 0;
      } else if (mouseX >250 && mouseX < 450) { // the left most button 
        push0(page0); // push page number to stack
        page0 = 1; // current page will be changed to 1
      }
    } else if (mouseY>280 && mouseY < 480) {
      if (mouseX >20 && mouseX < 220) {
        push0(page0); // push page number to stack
        page0 = 2; // current page will be changed to 2
      } else if (mouseX >250 && mouseX < 450) {
        push0(page0); // push page number to stack
        page0 = 3; // current page will be changed to 3
      }
    }
    show0_stack();
  }
}
