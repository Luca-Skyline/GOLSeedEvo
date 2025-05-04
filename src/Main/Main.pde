import java.util.Arrays;

int lastFrame;
int frameLength = 50; //milliseconds
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
}

void draw(){  
  background(0);
  control.display(allBestSeeds.size());
  
  
  Seed temp = control.getSeed();
  if(temp != null){
    allBestSeeds.add(temp);    
  }
  temp = control.queueSeed();
  if(temp != null){
    currentState = temp;
    lastFrame = millis();
  }
  
  if(currentState != null){
    currentState.display();
    
    if(millis() > lastFrame + frameLength){
      currentState = currentState.nextState();
    }
  }
  
}  


void mouseReleased(){
  control.detectButtonPressed();
}
