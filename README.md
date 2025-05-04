# GOLSeedEvo

# Instructions

## Run Instructions
- Download Zip of repository
- Open the src/Main/Main.pde file in Processing.pde
- Click run!

## Use Instructions
- You won't be able to do anything until you create your first generation. Follow the on-screen prompt by clicking "New Generation."
- Wait for the first generation to be created.
- The default screen is the mutation controller. In the center of the controller you will see the best seed from that generation. From here you can also choose to generate new seeds, see old seeds, play the best/worst seed in that generation, or close the controller.
- If you choose to play a seed or close the controller, the controller will go away and you will see a black screen. If a seed is queued, it will play out in it entirety here. To open the controller, click the "CTRL" button in the top left corner. Opening the controller will not cause a seed to stop playing; it is merely a panel that exists on top of the always-running CGoL grid. You can close the controller and view a running simulation with the "X" button at the top right of the controller.
- From the controller, if you choose to view prior seeds, you will be presented with the data. To go back, click the arrow at the top left of the controller.
- You can change the number of mutations per generation by clicking the relevant button. Type the number you want and click "ENTER" or "RETURN".

# Overview

An OOP program that uses a custom evolutionary algorithm in hopes of discovering new fascinating seeds for [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

First, a few notes about this project:
- It is not intended to serve any practical purpose whatsoever. It exists only for the sake of knowledge and beauty.
- Due to the nature of Conway's Game of Life, there is a high liklihood it reveals nothing even when it's fully complete. 
- As far as I'm aware, this hasn't been done before. If it has, my approach will be unique.

# Class Diagram

![Class Diagram](https://github.com/Luca-Skyline/GOLSeedEvo/blob/09a0788a950148ace86985fa7c4a3c374026512c/imgs/GOL%20Class%20Diagram.png)


# Mockup
Example Seed (Gosper's Glider Gun):

![Seed](https://github.com/Luca-Skyline/GOLSeedEvo/blob/5a95628deee0261f5b70e11dbdc0a911b16b8705/imgs/Gospers_glider_gun.gif)


# Year-Two Concepts:
- inheritance
- multidimensional arrays
- i/o
- enhanced for loop :)
- recursion?
