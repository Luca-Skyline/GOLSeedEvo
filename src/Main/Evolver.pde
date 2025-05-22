class Evolver{
  
  private Seed originalSeed;
  private Seed[] mySeeds;
  private int[] results;
  private int iterations;
  private int frameSize;
  
  private Seed bestSeed;
  private Seed worstSeed;

  public Evolver(Seed seed, int iterations, int frameSize){
    originalSeed = seed;
    mySeeds = new Seed[iterations];
    results = new int[iterations];
    this.iterations = iterations;
    this.frameSize = frameSize;
    

  }
  
  public void generateSeeds(){
    for(int i = 0; i < iterations; i++){
      boolean[][] newSeed = new boolean[frameSize][frameSize];
      for(int j = 0; j < frameSize; j++){
        for(int k = 0; k < frameSize; k++){
          newSeed[j][k] = originalSeed.getState()[j][k];
        }
      }
      
      ArrayList<Integer[]> existingPoints = new ArrayList<Integer[]>();
      for(int j = 0; j < frameSize; j++){
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
    
    int bestIndex = 0;
    int worstIndex = 0;
    println("starting");
    mySeeds[0].findLifetime();
    for(int i = 1; i < iterations; i++){
      mySeeds[i].findLifetime();
      println(i + " - " + mySeeds[i].getLifetime());
      if(mySeeds[i].getLifetime() > mySeeds[bestIndex].getLifetime()){
        //print("now");
        bestIndex = i;
      }
      else if(mySeeds[i].getLifetime() < mySeeds[worstIndex].getLifetime()){
        //print("other now");
        worstIndex = i;
      }
    }
    
    println(bestIndex);
    
    bestSeed = mySeeds[bestIndex];
    worstSeed = mySeeds[worstIndex];
    
  }
  
  public Seed bestSeed(){
    return bestSeed;
  }
  
  public Seed worstSeed(){
    return worstSeed;
  }
  
}
