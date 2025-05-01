class Evolver{
  
  Seed originalSeed;
  Seed[] mySeeds;
  int[] results;
  int iterations;
  int frameSize;

  public Evolver(Seed seed, int iterations, int frameSize){
    originalSeed = seed;
    mySeeds = new Seed[iterations];
    results = new int[iterations];
    this.iterations = iterations;
    this.frameSize = frameSize;
  }
  
  public void generateSeeds(){
    boolean[][] newSeed = originalSeed.getState();
    for(int i = 0; i < iterations; i++){
      ArrayList<Integer[]> existingPoints = new ArrayList<Integer[]>();
      for(int j = 0; i < frameSize; i++){
        for(int k = 0; k < frameSize; k++){
          if(newSeed[j][k]){
            Integer[] temp = {j,k};
            existingPoints.add(temp);
          }
        } 
      }
         
      for(int j = 0; j <= int(random(0, 4)); j++){
        int index = int(random(existingPoints.size()));
        Integer[] myPoint = existingPoints.get(index);
        int x = myPoint[0] + int(random(-2, 3));
        int y = myPoint[1] + int(random(-2, 3));
        newSeed[x][y] = !newSeed[x][y];
      }
      
      mySeeds[i] = new Seed(newSeed, frameSize);
    }
  }
  
  public Seed bestSeed(){
    int bestIndex = 0;
    for(int i = 1; i < iterations; i++){
      if(mySeeds[i].getLifetime() > mySeeds[bestIndex].getLifetime()){
        bestIndex = i;
      }
    }
    
    return mySeeds[bestIndex];
  }
  
}
