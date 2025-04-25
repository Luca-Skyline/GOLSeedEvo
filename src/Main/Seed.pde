class Seed extends State{
  
  private int lifetime;
  
  public Seed(boolean[][] position, int frameSize){
    super(position, frameSize);
  }
  
  public int getLifetime(){
    return lifetime;
  }
  
  public void findLifetime(){
    State[] states;
    states = new State[6];
    int frames = 0;
    State s = this;
    while(true){
      boolean shouldBreak = false;
      for(State test : states){ //compare to prior states
        if(test != null){
          if(Arrays.deepEquals(s.getState(), test.getState())){
            shouldBreak = true;
          }
        }
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
      
      s = s.nextState(); //next state
      
      frames++;
    }
    
    lifetime = frames;
  }
}
