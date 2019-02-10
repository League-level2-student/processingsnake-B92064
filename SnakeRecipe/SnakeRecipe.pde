
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
  public int xSet(){
   this.x = x; 
  }
  public int ySet(){
   this.y = y; 
  }
}
  // 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
  Segment head;


  // 6. Create and initialize a String to hold the direction of your snake e.g. "up"

  String direction;

  // 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
  // give it a value of 1 to start.

  int points = 1;

  // 8. Create and initialize foodX and foodY variables to hold the location of the food.
  int foodX = new int();
  int foodY = new int();
  // (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

  foodX = (int)random(500);
  foodY = (int)random(500);

void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.

head = new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {

  background(0);
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
  rect(10, 10, 10, 10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  rect(10, 10, 10, 10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(dir) {
   case "up":
   head.getY(head.getY() - 10);
   break;
   case "down":
   head.getY(head.getY() + 10);
   break;
   case "left":
   head.getX(head.getX() - 10);
   break;
   case "right":
   head.getX(head.getX() + 10);
   break;
   }
   


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if(keycode == "38"){
    if(switch(dir) != "down"){
    switch("up");
    }
  }
  else if(keycode == "40"){
      if(switch(dir) != "up"){
    switch("down");
    }
  }
    else if(keycode == "37"){
      if(switch(dir) != "right"){
    switch("left");
    }
  }
    else if(keycode == "39"){
   if(switch(dir) != "left"){
    switch("right");
    }
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(x>500){
    x=0;
  }
  else if(x<0){
   x=500; 
  }
    if(y>500){
    y=0;
  }
  else if(y<0){
   y=500; 
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {

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
tail.add(Segment(x,y));
  // To keep your tail the right length:
  if(tail.size() > points){
    
  }
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
}

void drawTail() {
  // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...

  // reset your food variable

  //Call this method at the beginning of your manageTail method.
}
}
