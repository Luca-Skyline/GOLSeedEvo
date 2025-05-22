public class Controller{

  private Button newGeneration;
  private Button seeGenerations;
  private Button setMutations;
  private Button playBest;
  private Button playWorst;
  private Button showController;
  private Button hideController;
  private Button backButton;
  
  private Evolver evo;
  
  boolean on;
  boolean showOlds;
  boolean generateNewSeed;
  boolean userTyping;
  Seed latestBestSeed;
  int latestBestLifetime;
  String userType;
  
  Seed seed; //for adding to universal list
  Seed queueSeed; //for playing on screen
  
  int mutations;
  
  public Controller(Seed startSeed){
    
    newGeneration = new Button(320, 750, 400, 50, "New Generation", 20);
    seeGenerations = new Button(250, 150, 200, 50, "Old Seeds", 20);
    setMutations = new Button(250, 210, 200, 50, "Set Mutations", 20);
    playBest = new Button(650, 690, 200, 50, "Play Best Seed", 20);
    playWorst = new Button(650, 750, 200, 50, "Play Worst Seed", 20);
    hideController = new Button(770, 130, 40, 40, "X", 30);
    backButton = new Button(130, 130, 40, 40, "←", 30);
    on = true;
    generateNewSeed = false;
    
    showController = new Button(50, 30, 80, 40, "CTRL", 30);
    
    mutations = 100;
    
    latestBestSeed = startSeed;
   
  }
  
  public void display(ArrayList<Seed> oldGenerations){
    
    if(generateNewSeed){
        evo = new Evolver(latestBestSeed, mutations, 300);
        evo.generateSeeds();
        latestBestSeed = evo.bestSeed();
        latestBestLifetime = latestBestSeed.getLifetime();
        seed = latestBestSeed;
        generateNewSeed = false;
    }
    
    if(on){
      noStroke();
      fill(100);
      rect(100, 100, 700, 700);
      hideController.display();
      hideController.hover(mouseX, mouseY);
      if(showOlds){
        textSize(20);
        textAlign(CENTER, CENTER);
        fill(200);
        if(oldGenerations.size() == 0){
          text("There are no generations to show.", 450, 200);
        }
        else{
          text("Generation:", 400, 200);
          text("Lifetime:", 500, 200);
          for(int i = 0; i < oldGenerations.size(); i++){
            text(i+1, 400, 220+(i*20));
            text(oldGenerations.get(i).getLifetime(), 500, 220+(i*20));
          }
        }
        
        backButton.display();
        backButton.hover(mouseX, mouseY);
      }
      else{
        newGeneration.display();
        seeGenerations.display();
        setMutations.display();
        playBest.display();
        playWorst.display();
        newGeneration.hover(mouseX, mouseY);
        seeGenerations.hover(mouseX, mouseY);
        playBest.hover(mouseX, mouseY);
        playWorst.hover(mouseX, mouseY);
        setMutations.hover(mouseX, mouseY);
        
       textAlign(TOP, LEFT);
        fill(200);
        textSize(20);
        text("Number of generations: " + oldGenerations.size(), 375, 160);
        if(userTyping){
          text("Mutations per generation: " + userType, 375, 220);
        }else{
          text("Mutations per generation: " + mutations, 375, 220);
        }
        
        textAlign(CENTER, CENTER);
        
        if(oldGenerations.size() == 0){
          text("You have not generated any seeds yet.\nClick 'New Generation' to get started.", 320, 690);
        } else {
          text("The most successful seed of this\ngeneration had a lifetime of " + latestBestLifetime + " frames.", 320,690);
        }
        
        if(latestBestSeed.getLifetime() > 2){
          latestBestSeed.display(color(50, 0, 100));
        }
      }
    }
    else{
      showController.display();
      showController.hover(mouseX, mouseY);
    }
  }
  
  public void detectButtonPressed(){
    if(on){
      if(playBest.isHovered() && (latestBestSeed.getLifetime() > 2)){
        queueSeed = evo.bestSeed();
        on = false;
      } else if(playWorst.isHovered() && (latestBestSeed.getLifetime() > 2)){
        queueSeed = evo.worstSeed();
        on = false;
        //queueSeed = evo.worstSeed();
      } else if(hideController.isHovered()){
        on = false;
      } else if(newGeneration.isHovered()){
        noStroke();
        fill(100);
        rect(105, 650, 420, 150);
        fill(200, 0, 0);
        textAlign(CENTER, CENTER);
        text("Generation in progress. Depending on the\nnumber of mutations, this could take\nseveral minutes or more. Please wait.", 320, 700);
        generateNewSeed = true;  
      } else if(seeGenerations.isHovered()){
        showOlds = true;
        seeGenerations.turnOff();
      } else if(backButton.isHovered()){
        showOlds = false;
        backButton.turnOff();
      } else if(setMutations.isHovered()){
        userTyping = true;
        userType = "|";
      }
    }
    else{
      if(showController.isHovered()){
          on = true;
      }
    }
  }
  
  public void detectKeyPressed(char k){
    if(userTyping){
      if(k == RETURN || k == ENTER){
        userTyping = false;
        try{
          mutations = Integer.parseInt(userType.substring(0, userType.length()-1));
        } catch (Exception e){
          //go back to way it was before!
        }
      }
      userType = userType.substring(0, userType.length()-1) + k + "|";
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
