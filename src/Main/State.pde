class State{
  boolean[][] cells;
  int frameSize;
  
  public State(boolean[][] position){
    cells = position;
    frameSize = 100;
  }
  
  public State nextState(){
    boolean[][] newCells;
    newCells = new boolean[frameSize][frameSize];
    for(int i = 0; i < frameSize; i++){
      for(int j = 0; j < frameSize; j++){
        newCells[i][j] = false;
        cells[i][j] = false;
        int neighbors = 0;
        for(int k = i - 1; k <= i + 1; k++){
          for(int l = j -1; l <= j+1; l++){
            if(cells[k][l]){
              neighbors++;
            }
          }
        }
        if(cells[i][j] && (neighbors == 2 || neighbors == 3)){ //currently alive
            newCells[i][j] = false;
        } else {
          
        }
      }
    }
  }
  
  public void display(){
  
  }
  
}
