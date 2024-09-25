# GamePublish
A template repository to publish games

##Class Publishing Demos

##Project 1: Coin Dash

  
  [Phase 1](CoinDash/index.html)
  
  [Phase 2](CoinDash2/index.html)
  

##Coin Dash

[Sep 6](WCU-CS-CooperLab/csc476f24-demo-games-GamePublish:main)


##Space Rocks

[Sep 11](demo-games-Makbark/SpaceRocksSep11/)
-  Create screen wrap and shooting
-  Create bullet node and add sprite 2d, collision shape 2d, and visible on screen as child nodes
-  Add PNG bullet image to sprite texture 
- adjust the capsule shape to fit the bullet size
- create bulled logic for the speed of bullet and if its collided with a rock
- create a muzzle that acts as the marker for where the bullet spawns when player shoots
- create a timer node for player that acts as a gun cooldown timer
- create a main scene where all the game nodes will be placed

[Sep 16](SpaceRocksSep16)
-  Create new scene for rocks
-  Create rock path so rocks can spawn on the border of the screen
-  Create script for when rocks hit each other they bounce off


[Sep 18](SpaceRocksSep18/index.html)
-  Create HUD canvas layer
-  Add HBox containing the score and lives counter
-  add VBox for the message showing the title of the game and what wave you're on
-  also add the button to start the game within the same VBox as the message
-  add instance of HUD to main script to start game when pressing the button an call new game function 
