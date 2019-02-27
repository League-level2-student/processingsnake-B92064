
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
  int x;
  int y;
  // 3. Add a constructor with parameters to initialize each variable.
  Segment(int x, int y) {
    this.x = x;
    this.y = y;
  }
  // 4. Add getter and setter methods for both the x and y member variables.
  public int xGet() {
    return x;
  }
  public int yGet() {
    return y;
  }
  public void  xSet(int x) {
    this.x = x;
  }
  public void ySet(int y) {
    this.y = y;
  }
}
// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;

boolean visible= false;
// 6. Create and initialize a String to hold the direction of your snake e.g. "up"

String direction = "up";

// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.

int points = 1;

// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX;
int foodY;
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)
void setup() {
  foodX = (int)random(500);
  foodY = (int)random(500);

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.

  head = new Segment(250, 250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {

  background(0);
  if (foodX%10 ==0) {
  } else if (foodX %10!= 0) {
    foodX = (int)random(500);
  }
  if (foodY%10 ==0) {
  } else if (foodY %10!= 0) {
    foodY = (int)random(500);
  }
  if(foodY  %10 == 0 && foodX%10 ==0){
    visible = true;
  }else if (foodY  %10 == 0 && foodX%10 ==0){
   visible =false; 
  }
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();

  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
}
/*

 */
// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
if(visible == true){
  rect(foodX, foodY, 10, 10);
}
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  rect(head.xGet(), head.yGet(), 10, 10);

  //test your code
}


// 15. Complete the move method below.

void move() {
  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:

  switch(direction) {
  case "up":
    head.ySet(head.yGet() - 10);
    break;
  case "down":
    head.ySet(head.yGet() + 10);
    break;
  case "left":
    head.xSet(head.xGet() - 10);
    break;
  case "right":
    head.xSet(head.xGet() + 10);
    break;
  }
  drawSnake();

  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed(KeyEvent evt) {
  int keycode = evt.getKeyCode();
  if (keycode == 38) {
    if (!direction.equals("down")) {
      direction = "up";
    }
  } else if (keycode == 40) {
    if (!direction.equals("up")) {
      direction = "down";
    }
  } else if (keycode == 37) {
    if (!direction.equals("right")) {
      direction = "left";
    }
  } else if (keycode == 39) {
    if (!direction.equals("left")) {
      direction = "right";
    }
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if (head.xGet()>500) {
    head.xSet(0);
  } else if (head.xGet()<0) {
    head.xSet(500);
  }
  if (head.yGet()>500) {
    head.ySet(0);
  } else if (head.yGet()<0) {
    head.ySet(500);
    ;
  }
  drawSnake();
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {
  if (head.xGet()==foodX && head.yGet() == foodY) {
    points++;
    foodX = (int)random(500);
    foodY = (int)random(500);
    visible = false;
  }
  // If the segment is colliding with a piece of food...
  // Increase the amount of food eaten and set foodX and foodY to new random locations.
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment> tail = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  tail.add(new Segment(head.xGet(), head.yGet()));
  // To keep your tail the right length:
  if (tail.size() > points) {
    tail.remove(0);
  }
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
}

void drawTail() {
  // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
  for (int i =0; i < tail.size(); i++) {
    rect(tail.get(i).x, tail.get(i).y, 10, 10);
    //tail.add(new Segment((head.xGet()+10*i),(head.yGet()+10*i)));
    //head.xSet(head.xGet() +10);
    //head.ySet(head.yGet() +10);
    //rect(head.xGet(),head.yGet(),10,10);
  }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {
  for (int i =0; i < tail.size(); i++) {
    if (head.xGet() == tail.get(i).x && head.yGet() == tail.get(i).y) {
      println(points);
      points =0;
    }
  }
  // If your head has the same location as one of your segments...

  // reset your food variable
  //points = 0;
  //Call this method at the beginning of your manageTail method.
}
