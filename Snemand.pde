//Snow catching game.
//Move the snowman to collect the falling snow.
//The score result is projectet on the screen.

Catcher catcher;    // One catcher object
Timer timer;        // One timer object
Snow[] snows;       // An array of snow objects
int totalSnows = 0; // totalSnows

void setup() {
  fullScreen();
  catcher = new Catcher(32); // Create the first catcher with a radius of 32
  snows = new Snow[10000];    // Create 10000 spots in the array
  timer = new Timer(-1);    // Create a timer that goes off
  timer.start();             // Starting the timer
}

void draw() {
  //The background is set to a gray tone
  background(120);

  // Set catcher location
  catcher.setLocation(mouseX, mouseY); 
  // Display the catcher
  catcher.display(); 

  // Check the timer
  if (timer.isFinished()) {
    // Deal with snowflakes
    // Initialize one snow
    snows[totalSnows] = new Snow();
    // Increment totalSnows
    totalSnows ++ ;
    // If we hit the end of the array
    if (totalSnows >= snows.length) {
      totalSnows = catcher.score; // Start over
    }
    timer.start();
  }
  textSize(80);
  text("Score:" + catcher.score, 60,60);

  // Move and display all snowflakes
  for (int i = 0; i < totalSnows; i++ ) {
    snows[i].move();
    snows[i].display();
    if (catcher.intersect(snows[i])) {
      snows[i].caught();
    }
  }
}
