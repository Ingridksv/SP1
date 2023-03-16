class Catcher { 
  
  float r;    // radius
  color col;  // color
  float x, y; // location
  int y1 = 1159; //initializing the position of the smallest ellipse on the y-axis
  int y2 = 1230; //-||- the second ellipse on the y-axis
  int y3 = 1336; //-||- the biggest ellipse on the y-axis
  int score = 0;

  Catcher(float tempR) {
    r = tempR;
    //My snowman is set to be white
    col = color(255);
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(0);
    fill(col);
    //Snowman's body
    ellipse(mouseX,y1,r*1.8,r*1.8);
    ellipse(mouseX,y2,r*2.6,r*2.6);
    ellipse(mouseX,y3,r*4,r*4);
    
    //Snowman's nose
    fill(255,165,0);
    triangle(mouseX,y1,mouseX,y1+6,mouseX+30,y1+3);
    
    //Snowman's eyes
    fill(0);
    ellipse(mouseX-15,y1-5,8,8);
    ellipse(mouseX+15,y1-5,8,8);
    
    //Snowman's mouth
    ellipse(mouseX-13,y1+10,2,2);
    ellipse(mouseX-11,y1+13,2,2);
    ellipse(mouseX-8,y1+15,2,2);
    ellipse(mouseX-5,y1+17,2,2);
    ellipse(mouseX-2,y1+17,2,2);
    ellipse(mouseX, y1+17,2,2);
    ellipse(mouseX+2,y1+17,2,2);
    ellipse(mouseX+5,y1+17,2,2);
    ellipse(mouseX+8,y1+15,2,2);
    ellipse(mouseX+10,y1+13,2,2);
    ellipse(mouseX+13,y1+10,2,2);
    
    //snowman's buttons
    ellipse(mouseX,y1+50,5,5);
    ellipse(mouseX,y1+65,5,5);
    ellipse(mouseX,y1+80,5,5);
    
    //snowman's right arm
    line(mouseX+39,y1+60,mouseX+90,y1);
    //right fingers
    line(mouseX+90,y1,mouseX+75,y1-8);
    line(mouseX+90,y1,mouseX+90,y1-18);
    line(mouseX+90,y1,mouseX+105,y1-8);
    
    //snowman's left arm
    line(mouseX-39,y1+60,mouseX-90,y1);
    //left fingers
     line(mouseX-90,y1,mouseX-75,y1-8);
    line(mouseX-90,y1,mouseX-90,y1-18);
    line(mouseX-90,y1,mouseX-105,y1-8);
    
    //snowman's hat
    rect(mouseX-23,y1-74,45,50);
    //hatline
    line(mouseX-50,y1-23,mouseX+50,y1-23);

  }

  // A function that returns true or false based on if the catcher intersects a snowflake
  boolean intersect(Snow s) {
    // Calculate distance, one for each ellipse of the snowman
    float distance = dist(mouseX, y1, s.x, s.y);
    float distance2 = dist(mouseX,y2, s.x, s.y);
    float distance3 = dist(mouseX,y3, s.x, s.y);

    // Compare distance to sum of radii, for each ellipse of the snowman.
    // Increase score with one for each snowflake
    if (distance < r + s.r || distance2 < r+1.8 +s.r || distance3 < r+33 + s.r) { 
      score++;
      return true;
    } else {
      return false;
    }
  }
}
