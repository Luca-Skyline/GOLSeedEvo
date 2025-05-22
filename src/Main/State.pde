class State{
  protected boolean[][] cells;
  protected int frameSize;
  
  public State(boolean[][] position, int frameSize){
    cells = position;
    this.frameSize = frameSize;
  }
  
  public boolean[][] getState(){
    return cells;
  }
  
  public State nextState(){
    boolean[][] newCells;
    newCells = new boolean[frameSize][frameSize];
    for(int i = 1; i < frameSize-1; i++){
      for(int j = 1; j < frameSize-1; j++){
        int neighbors = 0;
        for(int k = i - 1; k <= i + 1; k++){
          for(int l = j -1; l <= j+1; l++){
            if(cells[k][l] && !(k == i && l == j)){
              neighbors++;
            }
          }
        }
        newCells[i][j] = false;
        if(cells[i][j] && (neighbors == 2 || neighbors == 3)){ //currently alive
          newCells[i][j] = true;
        } else if (!cells[i][j] && neighbors == 3) {
          newCells[i][j] = true;
        }
      }
    }
    return new State(newCells, frameSize);
  }
  
  public void display(color col){
    
    for(int i = 0; i < frameSize; i++){
      //System.out.println();
      for(int j = 0; j  < frameSize; j++){
        //System.out.print(cells[i][j] + " ");
        if(cells[i][j]){
          fill(col);
          noStroke();
          rect(i*(width/frameSize), j*(height/frameSize), width/frameSize, width/frameSize);
        }
      }
    }
  }
  
}
