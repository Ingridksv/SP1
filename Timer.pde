// Object-oriented timer
class Timer {

  int savedTime; // When Timer started
  int totalTime = 3000; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in seconds.
    savedTime = second();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = second()- savedTime;
    if (passedTime > totalTime) {
      text("5 seconds have passed!",70,70);
      return true;
    } else {
      return false;
    }
  }
  
}
