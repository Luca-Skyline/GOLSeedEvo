class Evolver{
  
  Seed originalSeed;
  Seed[] mySeeds;
  int[] results;
  int iterations;

  public Evolver(Seed seed, int iterations){
    originalSeed = seed;
    mySeeds = new Seed[iterations];
    results = new int[iterations];
    this.iterations = iterations;
  }
  
  public void generateSeeds(){
    for(int i = 0; i < iterations; i++){
      
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
