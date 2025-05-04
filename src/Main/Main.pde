import java.util.Arrays;

int lastFrame;
int frameLength = 20; //milliseconds
ArrayList<Seed> allBestSeeds;

Controller control;

State currentState;

void setup(){
  size(900, 900);
  boolean[][] startPos = new boolean[300][300];
  for(int i = 0; i < startPos.length; i++){
    for(int j = 0; j < startPos.length; j++){
      startPos[i][j] = false;
    }
  }
  startPos[150][150] = true;
  Seed startSeed = new Seed(startPos, 300);
  
  allBestSeeds = new ArrayList<Seed>();
  control = new Controller(startSeed);
  
  frameRate(600.0);
}

void draw(){  
  background(0);
  
  
  
  Seed temp = control.getSeed();
  if(temp != null){
    allBestSeeds.add(temp);    
  }
  temp = control.queueSeed();
  if(temp != null){
    currentState = temp;
    lastFrame = millis();
    frameLength = 2000/(temp.getLifetime());
  }
  
  if(currentState != null){
    currentState.display(color(255));
    
    if(millis() > lastFrame + frameLength){
      currentState = currentState.nextState();
      lastFrame = millis();
    }
  }
  
  control.display(allBestSeeds);
  
}  


void mouseReleased(){
  control.detectButtonPressed();
}

void keyReleased(){
  control.detectKeyPressed(key);
}
