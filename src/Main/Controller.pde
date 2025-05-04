public class Controller{

  Button newGeneration;
  Button seeGenerations;
  Button setMutations;
  Button playBest;
  Button playWorst;
  Button showController;
  Button hideController;
  
  Evolver evo;
  
  boolean on;
  Seed latestBestSeed;
  int latestBestLifetime;
  
  Seed seed; //for adding to universal list
  Seed queueSeed; //for playing on screen
  
  int mutations;
  
  public Controller(Seed startSeed){
    
    newGeneration = new Button(450, 700, 400, 50, "New Generation", 20);
    seeGenerations = new Button(250, 200, 200, 50, "Old Seeds", 20);
    setMutations = new Button(250, 260, 200, 50, "Set Mutations", 20);
    playBest = new Button(650, 450, 200, 50, "Play Best Seed", 20);
    playWorst = new Button(650, 510, 200, 50, "Play Worst Seed", 20);
    hideController = new Button(770, 130, 40, 40, "X", 30);
    on = false;
    
    showController = new Button(30, 30, 40, 40, "✓", 30);
    
    mutations = 100;
    
    latestBestSeed = startSeed;
   
  }
  
  public void display(int oldGenerations){
    if(on){
      noStroke();
      fill(100);
      rect(100, 100, 700, 700);
      newGeneration.display();
      seeGenerations.display();
      setMutations.display();
      playBest.display();
      playWorst.display();
      hideController.display();
      newGeneration.hover(mouseX, mouseY);
      seeGenerations.hover(mouseX, mouseY);
      playBest.hover(mouseX, mouseY);
      playWorst.hover(mouseX, mouseY);
      setMutations.hover(mouseX, mouseY);
      hideController.hover(mouseX, mouseY);
      
      textAlign(LEFT, CENTER);
      fill(200);
      textSize(20);
      text("Number of generations: " + oldGenerations, 375, 200);
      text("Mutations per generation: " + mutations, 375, 260);
      
      if(oldGenerations == 0){
        text("You have not generated any seeds yet.\nClick 'New Generation' to get started.", 150, 475);
      } else {
        text("The most successful seed of this\ngeneration had a liftime of " + latestBestLifetime + " frames.", 150, 475);
      }
      
    }
    else{
      showController.display();
      showController.hover(mouseX, mouseY);
    }
  }
  
  public void detectButtonPressed(){
    if(on){
      if(playBest.isHovered()){
        queueSeed = evo.bestSeed();
        on = false;
      } else if(playWorst.isHovered()){
        on = false;
        //queueSeed = evo.worstSeed();
      } else if(hideController.isHovered()){
        on = false;
      } else if(newGeneration.isHovered()){
        noStroke();
        fill(200);
        rect(150, 400, 300, 200);
        text("Generation in progress. Depending on the number\nof mutations, this may take a hot second.\nPlease wait.", 150, 475);
        evo = new Evolver(latestBestSeed, mutations, 300);
        evo.generateSeeds();
        latestBestSeed = evo.bestSeed();
        latestBestLifetime = latestBestSeed.getLifetime();
        seed = latestBestSeed;
      }
    }
    else{
      if(showController.isHovered()){
          on = true;
      }
    }
  }
  
  public Seed getSeed(){
    if(seed != null){
      Seed temp = seed;
      seed = null;
      return temp;
    }
    return null;
  }
  
  public Seed queueSeed(){
    if(queueSeed != null){
      Seed temp = queueSeed;
      queueSeed = null;
      return temp;
    }
    return null;
  }

}
