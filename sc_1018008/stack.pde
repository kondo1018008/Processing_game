int page_index = 0; // this index shows next array element to save data 
int page_stack[] = new int[10]; // save pages in this array

void push(int p) {
  if (page_index > 9) return; // if stack over flows, do nothing

  page_stack[page_index] = page; // store current data to the stack
  ++page_index; // increments index
}

int pop() {
  if (page_index > 0) {
    page_index--;
  }
  return page_stack[page_index];
}

void show_stack() {
  // for monitoring the contents of page_stack[]
  print("history of visited pages (current is not included): ");
  for (int i = 0; i < page_index; i++) {
    print(page_stack[i]+" ");
  }
  println();
}
