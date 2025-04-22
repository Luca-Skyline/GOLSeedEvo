class Seed extends State{
  
  State[] states;
  
  public Seed(boolean[][] position, int frameSize){
    super(position, frameSize);
    states = new State[6];
  }
  
  public void runToEnd(){
    int frames = 0;
    State s = this;
    while(true){
      s = s.nextState(); //next state
      
      boolean shouldBreak = false;
      for(State test : states){ //compare to prior states
        try{
          if(s.getState() == test.getState()){
            System.out.println("sldkjf");
            shouldBreak = true;
          }
        } catch(Exception e){}
      }
      if(shouldBreak){break;}
      
      if(frames < 6){
        states[frames] = s;
      }
      else{
        for(int i = 0; i < 4; i++){
          states[i] = states[i+1];
        }
        states[5] = s;
      }
      
      frames++;
    }
    
    System.out.println(frames);

  }
}
