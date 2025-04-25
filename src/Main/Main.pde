import java.util.Arrays;

int lastFrame;
int frameLength = 50; //milliseconds

Seed mySeed;

void setup(){
  size(900, 900);
  boolean[][] startPos = new boolean[300][300];
  for(int i = 0; i < startPos.length; i++){
    for(int j = 0; j < startPos.length; j++){
      startPos[i][j] = false;
    }
  }
  //startPos[150][150] = true;
  //startPos[151][150] = true;
  //startPos[151][148] = true;
  //startPos[153][149] = true;
  //startPos[154][150] = true;
  //startPos[155][150] = true;
  //startPos[156][150] = true;
  startPos[150][150] = true;
  startPos[151][150] = true;
  startPos[149][150] = true;
  lastFrame = millis();
  
  mySeed = new Seed(startPos, 300);
  System.out.println("Here");
  mySeed.runToEnd();
}

void draw(){  
  background(0);
  //mySeed.display();
  //while(millis() < lastFrame + frameLength){}
  //mySeed = mySeed.nextState();
  //lastFrame = millis();
  
}  
