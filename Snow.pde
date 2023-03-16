class Snow {
  float x, y;   // Variables for location of snowflake
  float speed;  // Speed of snowflake
  color c;      //Color of the snowflake
  float r;      // Radius of snowflake

  Snow() {
    r = random(10,20);       // Create a random sized snowflake between 10 and 20 in diameter
    x = random(width);       // Start with a random x location
    y = -r*10;               // Start a little above the window
    speed = random(2, 6);    // Pick a random speed
    c = color(255);            // Color - white
  }

  // Move the snowflake down
  void move() {
    // Increment by speed
    y += speed;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + r*5) { 
      return true;
    } else {
      return false;
    }
  }

  // Display the snowflakes
  void display() {
    // Display the snowflake
    fill(c);
   for (int i = 2; i < r; i++ ) {
      ellipse(x, y, i*1, i*1); 
    }
  }
  // If the snowflake is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen, so the flake disapears 
    y = -1000;
  }
}
